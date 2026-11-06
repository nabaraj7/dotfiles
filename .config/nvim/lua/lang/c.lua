require("lang.registry").register({
    parsers = { "c", "cpp" },
    servers = { "clangd" },
    formatters = {
        c   = { "clang-format" },
        cpp = { "clang-format" },
    },
    lsp_config = {
        clangd = {
            cmd = { "clangd", "--background-index", "--clang-tidy" },
        },
    },
})
