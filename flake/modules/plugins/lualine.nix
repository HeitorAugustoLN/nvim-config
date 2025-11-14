{
  flake.modules.nixvim.lualine =
    { config, lib, ... }:
    {
      plugins.lualine = {
        enable = true;
        lazyLoad.settings = {
          before = lib.nixvim.mkRaw ''
            function()
              require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
            end
          '';

          event = "DeferredUIEnter";
        };

        settings = {
          options = {
            theme = "catppuccin";
            component_separators = "│";
            section_separators = {
              left = "";
              right = "";
            };
          };
          sections = {
            lualine_a = [
              {
                __unkeyed = "mode";
                right_padding = 2;
                separator.left = "";
              }
            ];

            lualine_b = [
              "branch"
              "diagnostics"
            ];

            lualine_c = [
              {
                __unkeyed = "filename";
                path = 3;
              }
            ];
            lualine_x = lib.nixvim.emptyTable;

            lualine_y = [
              "filetype"
              "progress"
            ];

            lualine_z = [
              {
                __unkeyed = "location";
                left_padding = 2;
                separator.right = "";
              }
            ];
          };

          inactive_sections = {
            lualine_a = [ "filename" ];
            lualine_b = lib.nixvim.emptyTable;
            lualine_c = lib.nixvim.emptyTable;
            lualine_x = lib.nixvim.emptyTable;
            lualine_y = lib.nixvim.emptyTable;
            lualine_z = [ "location" ];
          };

          tabline = lib.nixvim.emptyTable;
          extensions = lib.nixvim.emptyTable;
        };
      };
    };
}
