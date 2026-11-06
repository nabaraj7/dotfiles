-- Load order = dependency order
require("plugins.colorscheme")   -- must be first (highlight groups)
require("plugins.mini")          -- file manager, picker, editing helpers
require("plugins.treesitter")    -- reads lang.parsers
require("plugins.format")        -- reads lang.formatters
require("plugins.ui")            -- bufferline (needs devicons)
require("plugins.lsp")           -- reads lang.servers
require("plugins.finder")        -- mini.pick keymaps
require("plugins.git")           -- fugitive
require("plugins.notes")         -- obsidian (needs mini.pick)
require("plugins.tmux")          -- tmux config (neovim side)
