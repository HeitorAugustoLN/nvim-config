{
  flake.modules.nixvim.python =
    { pkgs, ... }:
    {
      lsp.servers.pyright.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.python = [ "ruff" ];
        lint.lintersByFt.python = [ "ruff" ];

        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
          pymanifest
          python
        ];
      };
    };
}
