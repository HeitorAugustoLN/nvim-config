return {
    "blink.cmp",
    after = function()
        require("blink.cmp").setup({ signature = { enabled = true } })
    end,
    event = { "CmdlineEnter", "InsertEnter" },
}
