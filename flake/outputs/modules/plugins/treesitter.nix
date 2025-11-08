{
  flake.modules.nixvim.treesitter =
    { pkgs, ... }:
    {
      plugins.treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          diff
          query
          vim
          vimdoc
        ];

        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };
}
