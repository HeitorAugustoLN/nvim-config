{
  flake.modules.nixvim.treesitter =
    { pkgs, ... }:
    {
      plugins.treesitter = {
        enable = true;
        folding = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          comment
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
