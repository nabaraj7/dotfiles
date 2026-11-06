vim.loader.enable()

require("vim._core.ui2").enable({})

require("config.options")
require("config.keymaps")
require("config.commands")

-- Populate language registry BEFORE plugins read it
require("lang")

-- Load all plugins in dependency order
require("plugins")
