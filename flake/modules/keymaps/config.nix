{
  flake.modules.nixvim.keymaps =
    { lib, ... }:
    {
      keymaps = [
        {
          mode = "n";
          key = "<leader>vc";
          action = lib.nixvim.mkRaw "function() vim.cmd.edit(vim.env.NIXVIM_INIT_SOURCE) end";
          options.desc = "Open the current built configuration";
        }
      ];
    };
}
