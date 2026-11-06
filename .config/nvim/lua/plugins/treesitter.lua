vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

local treesitter = require("nvim-treesitter")
local lang = require("lang.registry")

-- Support parsers you open but don't "develop in"
local base = { "vim", "vimdoc", "query", "bash", "json", "dockerfile" }

local parsers = vim.list_extend(vim.deepcopy(base), lang.parsers)

treesitter.install(parsers)

-- Start highlighting on every filetype that has a parser
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local buf = args.buf
        local l = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not l then return end
        if not pcall(vim.treesitter.language.add, l) then return end
        pcall(vim.treesitter.start, buf, l)
    end,
})
