vim.opt.conceallevel = 2

vim.pack.add({
    "https://github.com/obsidian-nvim/obsidian.nvim",
    "https://github.com/brianhuster/live-preview.nvim",
})

require("obsidian").setup({
    legacy_commands = false,
    workspaces = {
        { name = "My Notes", path = vim.env.OBSIDIAN_DIR or "~/notes" },
    },
    note_id_func = function(title)
        if title ~= nil and title ~= "" then
            return title:gsub(" ", "-"):gsub("[^A-Za-z0-9]", ""):lower()
        end
        return os.date("%Y-%m-%d-%H%M%S")
    end,
    link = { style = "wiki" },
    picker = { name = "mini.pick" },
    ui = { enable = true },
})

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", { desc = "New note" })
vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", { desc = "Backlinks" })
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian quick_switch<CR>", { desc = "Search notes" })

require("livepreview.config").set({
    port = 5500,
    browser = "brave-origin",
})
vim.keymap.set("n", "<leader>pp", "<cmd>LivePreview start<CR>", { desc = "Start preview" })
vim.keymap.set("n", "<leader>pc", "<cmd>LivePreview close<CR>", { desc = "Close preview" })
