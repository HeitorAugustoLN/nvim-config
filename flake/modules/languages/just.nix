{
  flake.modules.nixvim.just =
    { pkgs, ... }:
    {
      lsp.servers.just.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.just = [ "just" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.just ];
      };
    };
}
