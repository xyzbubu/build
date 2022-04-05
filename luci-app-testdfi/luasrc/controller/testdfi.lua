module("luci.controller.testdfi", package.seeall)

function index()

    entry({"admin", "TEST"}, firstchild(), "TEST", 60).dependent = false
    entry({"admin", "TEST", "testdfi"}, template("testdfi/testdfi"), _("test_dfi"), 10).dependent =true
    entry({"admin", "TEST", "testdfi_status"}, call("action_connections")).leaf = true
    entry({"admin", "TEST",  "nameinfo"}, call("action_nameinfo")).leaf = true
    
end

function action_connections()
	local sys = require "luci.sys"

	luci.http.prepare_content("application/json")

	luci.http.write("{ connections: ")
	luci.http.write_json(sys.net.conntrack())

	local bwc = io.popen("luci-bwc -c 2>/dev/null")
	if bwc then
		luci.http.write(", statistics: [")

		while true do
			local ln = bwc:read("*l")
			if not ln then break end
			luci.http.write(ln)
		end

		luci.http.write("]")
		bwc:close()
	end

	luci.http.write(" }")
end


function action_nameinfo(...)
	local util = require "luci.util"

	luci.http.prepare_content("application/json")
	luci.http.write_json(util.ubus("network.rrdns", "lookup", {
		addrs = { ... },
		timeout = 5000,
		limit = 1000
	}) or { })
end
