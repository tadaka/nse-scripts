# Common syntax to use when writing NSE scripts.
Basically so I don't have to keep hunting around for things.  Also
a future cheatsheet.


### Shortport
Shortport is a useful way of quickly determining whether a port is open
and thus the script in question be run against the target.

First you import the library, then you set the portrule to shortport.<service>

```Lua
local shortport = require "shortport"

portrule = shortport.http
```
### Full portrule syntax to check if a port is open
This bit of syntax is a bit longer, but isn't dependent on a library to
already be defined.  In this case, we are checking for the identd service
which is normally on port 113/tcp.  We tell Nmap the port number and protocol
to check, then set a variable to store whether the port/protocol is up.  In
this case, this is named "identd".  If the port is not up, then it gets
the value nil and Nmap doesn't run the script.  If it is not nil, then it
moves to the other checks to determine whether it is up.

```Lua
portrule = function(host, port)
	local auth_port = { number=113, protocol="tcp" }
	local identd = nmap.get_port_state(host, auth_port)

	return identd ~= nil
		and identd.state == "open"
		and port.protocol == "tcp"
		and port.state == "open"
end
```
