local shortport = require "shortport"
local http = require "http"
local stdnse = require "stdnse"

description = [[
Connects to a website, get's any cookies that are present and prints them
]]

---
-- @usage
-- nmap <target> --script=get-cookie
--
-- @output
-- 80/tcp open   http
-- | get-cookie:
-- |_ Cookie: name=<cookiename>; value=<cookievalue>; path=<cookiepath>
--
---

author = "Jason Wood"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = { "safe" }

portrule = shortport.http

action = function(host,port)

  local cookie_values = {}

  local path = nmap.registry.args.path

  if(path == nil) then
    path = '/'
  end

  local response = http.get(host, port, path)

  local cookiejar = {}

  for _, cookie in pairs(response.cookies) do

    stdnse.print_debug(0, "Cookie: name=%s; value=%s; path=%s", cookie.name, cookie.value, cookie.path)

    table.insert(cookiejar, "Cookie: name=" .. cookie.name .. "; value=" .. cookie.value .. "; path=" .. cookie.path)

   end

   return stdnse.format_output(true, cookiejar)

end
