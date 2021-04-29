local fs=require "nixio.fs"
local conffile="/var/log/tmpsnort.log"

f=SimpleForm("logview")
f.reset=false
f.submit=false
t=f:field(TextValue,"conf")
t.rmempty=true
t.rows=30
function t.cfgvalue()
	return fs.readfile(conffile) or ""
end
t.readonly="readonly"

return f