return {
    "showkeys",
    after = function()
        require("showkeys").setup({
            maxkeys = 8,
            position = "bottom-center",
            winopts = { border = "rounded" },
        })
    end,
    cmd = "ShowkeysToggle",
}
