local M = {
    parsers    = {},   -- treesitter parser names
    servers    = {},   -- LSP server names (Mason-managed)
    formatters = {},   -- filetype → formatter list
}

function M.register(spec)
    if spec.parsers then
        for _, p in ipairs(spec.parsers) do
            table.insert(M.parsers, p)
        end
    end

    if spec.servers then
        for _, s in ipairs(spec.servers) do
            table.insert(M.servers, s)
        end
    end

    if spec.formatters then
        for ft, fmts in pairs(spec.formatters) do
            M.formatters[ft] = fmts
        end
    end

    -- Per-server LSP settings, applied immediately
    if spec.lsp_config then
        for server, cfg in pairs(spec.lsp_config) do
            vim.lsp.config(server, cfg)
        end
    end
end

return M
