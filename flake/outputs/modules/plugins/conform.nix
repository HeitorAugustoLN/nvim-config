{
  flake.modules.nixvim.conform =
    { lib, ... }:
    {
      plugins = {
        conform-nvim = {
          enable = true;
          autoInstall.enable = true;

          lazyLoad.settings = {
            cmd = "ConformInfo";
            event = "BufWritePre";
          };

          settings.format_on_save = lib.nixvim.mkRaw ''
            function()
              return { timeout_ms = 500, lsp_format = "fallback" }
            end
          '';
        };

        lz-n.keymaps = [
          {
            plugin = "conform.nvim";
            key = "<leader>f";
            action = lib.nixvim.mkRaw ''
              function()
                require("conform").format({ async = true, lsp_format = "fallback" })
              end
            '';
            options.desc = "Format buffer";
          }
        ];
      };
    };
}
