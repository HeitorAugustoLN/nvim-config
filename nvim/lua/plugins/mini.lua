return {
  "mini.nvim",
  after = function()
    require("mini.ai").setup({ n_lines = 500 })

    local mini_clue = require("mini.clue")
    mini_clue.setup({
      clues = {
        mini_clue.gen_clues.square_brackets(),
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.marks(),
        mini_clue.gen_clues.registers(),
        mini_clue.gen_clues.windows(),
        mini_clue.gen_clues.z(),
        { mode = "n", keys = "<leader>s", desc = "+search" },
      },

      triggers = {
        -- Leader triggers
        { mode = { "n", "x" }, keys = "<Leader>" },

        -- `[` and `]` keys
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = { "n", "x" }, keys = "g" },

        -- Marks
        { mode = { "n", "x" }, keys = "'" },
        { mode = { "n", "x" }, keys = "`" },

        -- Registers
        { mode = { "n", "x" }, keys = '"' },
        { mode = { "i", "c" }, keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = { "n", "x" }, keys = "z" },
      },
    })

    require("mini.cmdline").setup()
    require("mini.diff").setup()
    require("mini.icons").setup()
    MiniIcons.mock_nvim_web_devicons()
    require("mini.statusline").setup()
    require("mini.surround").setup()
  end,
  event = "DeferredUIEnter",
}
