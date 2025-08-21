return {
    "nvim-treesitter",
    after = function()
        ---@diagnostic disable: missing-fields
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = {
                enable = true,
                disable = { "ruby" },
            },
        })
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", "DeferredUIEnter" },
    lazy = vim.fn.argc(-1) == 0,
}
