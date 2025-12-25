{
  flake.modules.nixvim.nix =
    { pkgs, ... }:
    {
      lsp.servers.nixd.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.parsers.nix ];
      };
    };
}
