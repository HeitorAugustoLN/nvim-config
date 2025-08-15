return {
    "nvim-treesitter",
    after = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost", "DeferredUIEnter" },
    lazy = vim.fn.argc(-1) == 0,
}
