local lang = require("lang.registry")

vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
    formatters_by_ft = lang.formatters,
    default_format_opts = {
        lsp_format = "fallback",  -- use LSP if no external formatter
    },
})

-- LazyVim-standard formatting key
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
