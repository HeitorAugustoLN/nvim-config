{
  flake.modules.nixvim.nix =
    { pkgs, ... }:
    {
      extraPackages = with pkgs; [
        deadnix
        statix
      ];

      lsp.servers.nixd.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];
        lint.lintersByFt.nix = [
          "deadnix"
          "statix"
        ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.nix ];
      };
    };
}
