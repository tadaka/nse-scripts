-- The Head
local shortport = require "shortport"

description = [[
My version of hello world
]]

---
-- @usage --script first-nse
--
-- @output
-- 80/tcp open   http
-- |_first-nse: Hi there!
--

author = "Jason Wood"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = { "safe" }

-- The Rule
portrule = shortport.port_or_service(80, "http", "tcp")

-- The Action
action = function(host,port)
  local myoutput = "Hi there!"

  return myoutput
end
