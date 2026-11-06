local lang = require("lang.registry")

vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

-- Add "/" before "mason" (this was a bug in your original)
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require("mason").setup()

-- Automatic install + automatic vim.lsp.enable() for every registered server
require("mason-lspconfig").setup({
    ensure_installed = lang.servers,
    automatic_enable = true,
})

-- Global capabilities
vim.lsp.config("*", { capabilities = vim.lsp.protocol.make_client_capabilities() })

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
})

-- LSP keymaps + native completion, only when a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover,      opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename,      { buffer = ev.buf, desc = "Rename symbol" })

        -- Native completion (replaces mini.completion)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
    end,
})
