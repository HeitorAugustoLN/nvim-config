{
  flake.modules.nixvim.conform =
    { config, lib, ... }:
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
              return { lsp_format = "fallback" }
            end
          '';
        };

        lz-n.keymaps = [
          {
            plugin = lib.getName config.plugins.conform-nvim.package;
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
