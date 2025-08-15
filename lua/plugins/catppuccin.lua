return {
    "catppuccin",
    after = function()
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = false,
        })
    end,
    colorscheme = "catppuccin",
}
