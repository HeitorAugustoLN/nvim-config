{
  flake.modules.nixvim.shell =
    { lib, pkgs, ... }:
    {
      extraPackages = [ pkgs.shellcheck ];
      lsp.servers.bashls.enable = true;

      plugins =
        let
          filetypes = [
            "bash"
            "sh"
            "zsh"
          ];
        in
        {
          conform-nvim.settings.formatters_by_ft = lib.genAttrs filetypes (_: [ "shfmt" ]);
          lint.lintersByFt = lib.genAttrs filetypes (_: [ "shellcheck" ]);

          treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
            bash
            zsh
          ];
        };
    };
}
