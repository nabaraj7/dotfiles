require("lang.registry").register({
    parsers = { "python" },
    servers = { "pyright" },
    formatters = {
        python = { "ruff_format" },
    },
})
