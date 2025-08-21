return {
    "which-key.nvim",
    after = function()
        require("which-key").setup({
            delay = 0,
            -- HACK: Workaround for folke/which-key.nvim#967, might keep it anyway
            show_help = false,
            spec = { { "<leader>s", group = "Search" } },
            preset = "helix",
        })
    end,
    cmd = "WhichKey",
    event = "DeferredUIEnter",
}
