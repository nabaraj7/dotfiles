vim.pack.add({
    "https://github.com/bluz71/vim-moonfly-colors",
})

vim.g.moonflyTransparent=true
vim.g.moonflyCursorColor = true

vim.g.moonflyNormalPmenu = true
vim.o.pumborder = "single"

vim.g.moonflyNormalFloat = true
vim.o.winborder = "single"

vim.cmd.colorscheme("moonfly")

