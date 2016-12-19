# Common syntax to use when writing NSE scripts.
Basically so I don't have to keep hunting around for things.  Also
a future cheatsheet.


## Shortport
Shortport is a useful way of quickly determining whether a port is open
and thus the script in question be run against the target.

First you import the function, then you set the portrule to shortport.<service>

local shortport = require "shortport"

portrule = shortport.http
