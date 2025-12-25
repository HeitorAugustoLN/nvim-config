{
  flake.modules.nixvim.markdown =
    { pkgs, ... }:
    {
      extraPackages = [ pkgs.markdownlint-cli2 ];
      lsp.servers.marksman.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.markdown = [ "prettier" ];
        lint.lintersByFt.markdown = [ "markdownlint-cli2" ];

        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
          markdown
          markdown_inline
        ];
      };
    };
}
