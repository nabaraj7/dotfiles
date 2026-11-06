local MiniPick = require("mini.pick")

vim.keymap.set("n", "<leader>ff", function()
    MiniPick.builtin.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
    MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Grep word under cursor" })

vim.keymap.set("n", "<leader>fb", function()
    MiniPick.builtin.buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>vh", function()
    MiniPick.builtin.help()
end, { desc = "Find help" })

-- Keymap discovery (LazyVim standard: <leader>sk)
vim.keymap.set("n", "<leader>sk", function()
    local items = {}
    for _, m in ipairs(vim.api.nvim_get_keymap("n")) do
        table.insert(items, string.format("%s → %s", m.lhs, m.desc or ""))
    end
    MiniPick.start({
        source = {
            name = "Keymaps",
            items = items,
            choose = function() end,
        },
    })
end, { desc = "Search keymaps" })
