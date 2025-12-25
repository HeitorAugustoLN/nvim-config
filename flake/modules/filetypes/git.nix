{
  flake.modules.nixvim.git =
    { pkgs, ... }:
    {
      plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
        diff
        git_config
        git_rebase
        gitattributes
        gitcommit
        gitignore
      ];
    };
}
