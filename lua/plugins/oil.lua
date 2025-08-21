return {
    "oil.nvim",
    after = function()
        require("oil").setup({
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                natural_order = true,
                show_hidden = true,
            },
            win_options = {
                wrap = true,
            },
        })
    end,
    before = function()
        require("lz.n").trigger_load("mini.icons")
    end,
    cmd = "Oil",
    lazy = vim.fn.argc(-1) == 0,
    keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
}
