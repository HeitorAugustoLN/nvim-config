{
  flake.modules.nixvim.lua =
    { pkgs, ... }:
    {
      lsp.servers.lua_ls.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.lua = [ "stylua" ];
        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          lua
          luadoc
          luap
        ];
      };
    };
}
