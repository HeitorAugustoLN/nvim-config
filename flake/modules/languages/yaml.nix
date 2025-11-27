{
  flake.modules.nixvim.yaml =
    { pkgs, ... }:
    {
      extraPackages = [ pkgs.yamllint ];
      lsp.servers.yamlls.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.yaml = [ "yamlfmt" ];
        lint.lintersByFt.yaml = [ "yamllint" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.yaml ];
      };
    };
}
