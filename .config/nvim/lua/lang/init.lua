-- To add a language:
--   1. Create lua/lang/<name>.lua following the pattern of c.lua
--   2. Add one require line below
--
-- To remove a language:
--   1. Delete the require line
--   2. Delete lua/lang/<name>.lua
--   3. Run :PackDel <server-name>  (optional, cleans Mason install)

require("lang.c")
require("lang.lua")
require("lang.markdown")
require("lang.python")
