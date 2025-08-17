return {
    "nvim-lspconfig",
    after = function()
        vim.lsp.enable({ "gdscript", "lua_ls", "nixd" })
    end,
    lazy = false,
}
