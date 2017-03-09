-- The Head
local shortport = require shortport

description = [[
Sean Jackson wuz here!!
]]

categories = {"safe"}

--The Rule
portrule = shortport.http

-- The Action
action = function (host,port)
  -- Do hacking
  return stuff
end
