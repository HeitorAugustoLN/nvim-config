{
  flake.modules.nixvim.vim =
    { pkgs, ... }:
    {
      plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
        vim
        vimdoc
      ];
    };
}
