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

portrule = shortport.http

action = function(host,port)
  local myoutput = "Hi there!"
  
  return myoutput
end
