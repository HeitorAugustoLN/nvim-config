{
  flake.modules.nixvim.lua =
    { pkgs, ... }:
    {
      extraPackages = [ pkgs.selene ];
      lsp.servers.lua_ls.enable = true;

      plugins = {
        conform-nvim.settings.formatters_by_ft.lua = [ "stylua" ];
        lint.lintersByFt.lua = [ "selene" ];

        treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.parsers; [
          lua
          luadoc
          luap
        ];
      };
    };
}
