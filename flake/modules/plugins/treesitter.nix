{
  flake.modules.nixvim.treesitter =
    { pkgs, ... }:
    {
      plugins.treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
          comment
          query
          vim
          vimdoc
        ];

        folding.enable = true;
        highlight.enable = true;
        indent.enable = true;
      };
    };
}
