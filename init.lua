local configPath = os.getenv("XDG_CONFIG_HOME") .. "\\" .. "nvim\\"

package.path = package.path .. ";" .. configPath  .. "?.lua;".. configPath .. "?\\init.lua;"

require("plugins")
require("themes")