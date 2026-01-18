return {
  "conform.nvim",
  after = function()
    require("conform").setup({ formatters_by_ft = { lua = { "stylua" }, nix = { "nixfmt" } } })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
      desc = "Format on save",
      group = vim.api.nvim_create_augroup("heitor/format_on_save", { clear = true }),
    })
  end,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ timeout_ms = 500 })
      end,
      mode = { "n", "x" },
      desc = "Format buffer",
    },
  },
}
