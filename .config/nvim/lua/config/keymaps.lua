vim.g.mapleader = " "

-- Save
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save current file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save current file" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })

-- Paste over selection without losing yank
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without overwriting register" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Clear search
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move selection up" })

-- Indent keep selection
vim.keymap.set("v", "<", "<gv", { desc = "Unindent, keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent, keep selection" })

-- Join without cursor jump
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines, keep cursor" })

-- Centered scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, centered" })

-- Centered search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result, centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev result, centered" })

-- Replace word globally
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor" })

-- Native undotree (built-in since 0.10)
vim.keymap.set("n", "<leader>u", ":Undotree<CR>", { desc = "Toggle undotree" })

-- Restart
vim.keymap.set("n", "<leader>re", ":restart<CR>", { desc = "Restart Neovim" })

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close buffer" })

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>",
        { desc = "Buffer " .. i })
end

-- Window cycling
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "Cycle windows" })

-- Native diagnostic list (replaces mini.extra diagnostic picker)
vim.keymap.set("n", "<leader>xx", function()
    vim.diagnostic.setqflist()
end, { desc = "Diagnostics to quickfix" })
