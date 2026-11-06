vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
})

-- File explorer
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in = "<CR>",
        go_in_plus = "L",
        go_out = "_",
        go_out_plus = "H",
    },
})

vim.keymap.set("n", "-", function() MiniFiles.open() end, { desc = "File explorer" })
vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Reveal current file" })

-- Notifications
require("mini.notify").setup({
    content = { format = function(n) return n.msg end },
})

-- Surround
require("mini.surround").setup()

-- Autopairs
require("mini.pairs").setup()
