local nmap = require "nmap"
local shortport = require "shortport"
local http = require "http"
local stdnse = require "stdnse"
local string = require "string"
local table = require "table"

description = [[
Uses provide credentials and logs into a Wordpress site.
Future: Check Wordpress version and check if out of date
]]

---
-- @usage
-- nmap <target> --script=wordpress-version-check
--
-- @output
-- 80/tcp open   http
-- | wordpress-version-check:
-- |_ Current Version: <Version Number>
-- |_ Installed Version:  <Installed Version Number>
--
---

author = "Jason Wood"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = { "safe" }

portrule = shortport.http

action = function(host,port)

  local path = nmap.registry.args.path

  if(path == nil) then
    path = '/'
  end

  -- Get the latest version number of wordpress from wordpress.org
  local wpresponse = http.get('wordpress.org', 443, '/download')
  local wpversion = string.match(wpresponse.body,"Download&nbsp;WordPress&nbsp;(%d+.%d+.%d+)")

  -- Get our installed version of Wordpress
  local response = http.get(host, port, path)
  local installedversion = ''


  -- Return the latest version and the installed version of wordpress
   return stdnse.format_output(true, wpversion)


   --  stdnse.debug(wpresponse.body)
   ---
   --  for _, cookie in pairs(response.cookies) do
   --    stdnse.debug(0, "Cookie: name=%s; value=%s; path=%s", cookie.name, cookie.value, cookie.path)
   --    table.insert(cookiejar, "Cookie: name=" .. cookie.name .. "; value=" .. cookie.value .. "; path=" .. cookie.path)
   --  end
   ---

end
