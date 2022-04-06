module("luci.controller.weburl", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/parentcontrol") then return end

	local e=entry({"admin","control","parentcontrol"},firstchild(),_("家长控制"),2)
	e.dependent=false
	entry({"admin","control","parentcontrol","time"},cbi("parentcontrol/time"),_("时间限制"),1).leaf=true
	entry({"admin", "control", "parentcontrol","weburl"}, cbi("parentcontrol/weburl"), _("网址过滤"), 20).leaf = true
        entry({"admin", "control", "parentcontrol","protocol"}, cbi("parentcontrol/protocol"), _("协议过滤"), 30).leaf = true 
	entry({"admin", "control", "parentcontrol","feature"}, cbi("parentcontrol/feature"), _("配置过滤库"), 40).leaf = true 
	entry({"admin", "control", "parentcontrol","status"}, call("status")).leaf = true
end

function status()
    local e = {}
    e.status = luci.sys.call("iptables -L FORWARD |grep PARENTCONTROL >/dev/null") == 0
    
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end
