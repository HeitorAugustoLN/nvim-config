return {
    "mini.ai",
    after = function()
        require("mini.ai").setup({ n_lines = 500 })
    end,
    event = "DeferredUIEnter",
}
