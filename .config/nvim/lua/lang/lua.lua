require("lang.registry").register({
    parsers = { "lua" },
    servers = { "lua_ls" },
    formatters = {
        lua = { "stylua" },
    },
    lsp_config = {
        lua_ls = {
            settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
            },
        },
    },
})
