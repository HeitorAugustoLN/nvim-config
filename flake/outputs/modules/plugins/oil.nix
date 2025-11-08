{
  flake.modules.nixvim.oil =
    { lib, ... }:
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

        settings = {
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;

          view_options = {
            natural_order = true;
            show_hidden = true;
            is_always_hidden = lib.nixvim.mkRaw ''
              function(name, _)
                local hidden_patterns = {
                  -- Development directories
                  "^%.direnv",
                  "^%.git",

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
          };

          win_options.wrap = true;
        };
      };
    };
}
