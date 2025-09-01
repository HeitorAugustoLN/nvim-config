return {
    "nvim-lspconfig",
    after = function()
        vim.lsp.enable({ "gdscript", "lua_ls", "nixd", "rust_analyzer" })
    end,
    lazy = false,
}
