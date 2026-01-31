return {
  "oil.nvim",
  after = function()
    require("oil").setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,

      view_options = {
        is_always_hidden = function(name, _)
          local ignore_patterns = require("ignore-patterns")

          return vim.iter(ignore_patterns):any(function(pattern)
            return name:match(pattern)
          end)
        end,

        natural_order = true,
        show_hidden = true,
      },

      win_options = { wrap = true },
    })

    vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
  end,
}
