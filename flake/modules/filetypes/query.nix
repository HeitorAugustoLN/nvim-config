{
  flake.modules.nixvim.query =
    { pkgs, ... }:
    {
      plugins.treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.parsers.query ];
    };
}
