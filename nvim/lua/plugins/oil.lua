return {
  "oil.nvim",
  after = function()
    require("oil").setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,

      view_options = {
        is_always_hidden = function(name, _)
          local dev_directories = { "^%.direnv$", "^%.git$" }

          local languages = {
            godot = {
              "^server%.pipe$",
              "^%.godot",
              "%.gd%.uid$",
              "%.import$",
              "%.tmp$",
            },

            nix = { "^result" },
          }

          return vim
            .iter({
              dev_directories,
              unpack(vim.tbl_values(languages)),
            })
            :flatten()
            :any(function(pattern)
              return name:match(pattern)
            end)
        end,

        natural_order = true,
        show_hidden = true,
      },

      win_options = { wrap = true },
    })
  end,
  before = function()
    require("lz.n").trigger_load("mini.icons")
  end,
  keys = { { "-", "<cmd>Oil<CR>", desc = "Open parent directory" } },
}
