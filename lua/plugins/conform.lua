return {
    "conform.nvim",
    after = function()
        require("conform").setup({
            format_on_save = function()
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                }
            end,
            formatters_by_ft = {
                gdscript = { "gdformat" },
                lua = { "stylua" },
                nix = { "nixfmt" },
                rust = { "rustfmt" },
            },
        })
    end,
    beforeAll = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    cmd = "ConformInfo",
    event = "BufWritePre",
    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end,
            desc = "Format buffer",
            mode = "",
        },
    },
}
