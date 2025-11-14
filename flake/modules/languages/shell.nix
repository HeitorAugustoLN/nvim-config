{
  flake.modules.nixvim.shell =
    { pkgs, lib, ... }:
    {
      extraPackages = [ pkgs.shellcheck ];
      lsp.servers.bashls.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft = lib.genAttrs [ "bash" "sh" "zsh" ] (_: [ "shfmt" ]);
        lint.lintersByFt = lib.genAttrs [ "bash" "sh" "zsh" ] (_: [ "shellcheck" ]);
        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          zsh
        ];
      };
    };
}
