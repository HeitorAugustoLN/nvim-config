{
  flake.modules.nixvim.gdscript =
    { pkgs, ... }:
    {
      lsp.servers.gdscript.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.gdscript = [ "gdformat" ];
        treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.gdscript ];
      };
    };
}
