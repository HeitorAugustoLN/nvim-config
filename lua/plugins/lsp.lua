return {
    "nvim-lspconfig",
    after = function()
        vim.lsp.enable({ "lua_ls", "nixd" })
    end,
    lazy = false,
}
