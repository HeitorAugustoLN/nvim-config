{
  flake.modules.nixvim.typst =
    { pkgs, ... }:
    {
      lsp.servers.tinymist.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.typst = [ "typstyle" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.typst ];
      };
    };
}
