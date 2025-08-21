return {
    "todo-comments.nvim",
    after = function()
        require("todo-comments").setup()
    end,
    event = { "BufNewFile", "BufReadPost", "BufWritePost" },
}
