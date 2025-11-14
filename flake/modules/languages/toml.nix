{
  flake.modules.nixvim.toml =
    { pkgs, ... }:
    {
      lsp.servers.taplo.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.toml = [ "taplo" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.toml ];
      };
    };
}
