{
  flake.modules.nixvim.oil =
    { config, lib, ... }:
    {
      keymaps = [
        {
          mode = "n";
          key = "-";
          action = "<cmd>Oil<CR>";
          options.desc = "Open parent directory";
        }
      ];

      plugins.oil = {
        enable = true;
        lazyLoad.settings.before = lib.nixvim.mkRaw ''
          function()
            require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
          end
        '';

        settings = {
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;

          view_options = {
            is_always_hidden = lib.nixvim.mkRaw ''
              function(name, _)
                local hidden_patterns = {
                  -- Development directories
                  "^%.direnv",
                  "^%.git$",

                  -- Godot files
                  "^server%.pipe$",
                  "^%.godot",
                  "%.gd%.uid$",
                  "%.import$",
                  "%.tmp$",
                }

                for _, pattern in ipairs(hidden_patterns) do
                  if name:match(pattern) then
                    return true
                  end
                end

                return false
              end
            '';

            natural_order = true;
            show_hidden = true;
          };

          win_options.wrap = true;
        };
      };
    };
}
