return {
    "blink.cmp",
    after = function()
        require("blink.cmp").setup()
    end,
    event = { "CmdlineEnter", "InsertEnter" },
}
