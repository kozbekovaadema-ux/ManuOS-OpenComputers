local fs = require("filesystem")
local dirs = {"/home", "/usr", "/usr/bin", "/lib", "/boot", "/bin", "/etc", "/tmp", "/var", "/var/log"}
for _, d in ipairs(dirs) do if not fs.exists(d) then fs.makeDirectory(d) end end
if not fs.exists("/etc/manuos.cfg") then local f = fs.open("/etc/manuos.cfg", "w") f:write("hostname=ManuOS\n") f:close() end
dofile("/bin/shell.lua")
