{
  flake.modules.nixvim.combinePlugins =
    { pkgs, ... }:
    {
      performance.combinePlugins = {
        enable = true;
        standalonePlugins = [ pkgs.vimPlugins.nvim-treesitter ];
      };
    };
}
