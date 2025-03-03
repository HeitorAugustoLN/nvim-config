{
  plugins.oil = {
    enable = true;
    lazyLoad.settings.before.__raw = ''
      function()
        require("lz.n").trigger_load("mini.nvim")
      end
    '';

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;

      view_options = {
        is_always_hidden.__raw = ''
          function(name, _)
            local hidden = { ".git", ".direnv" }

            for _, value in ipairs(hidden) do
              if name == value then
                return true
              end
            end
          end
        '';
        natural_order = true;
        show_hidden = true;
      };

      win_options = {
        wrap = true;
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>Oil<CR>";
      key = "-";
      mode = "n";
      options = {
        desc = "Open parent directory";
      };
    }
  ];
}
