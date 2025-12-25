{
  flake.modules.nixvim.keymaps =
    { lib, ... }:
    {
      keymaps = [
        {
          mode = "n";
          key = "<leader>q";
          action = lib.nixvim.mkRaw "vim.diagnostic.setloclist";
          options.desc = "Open diagnostic quickfix list";
        }
      ];
    };
}
