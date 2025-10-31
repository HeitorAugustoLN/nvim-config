{
  flake.modules.nixvim.oil = {
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
        };

        win_options.wrap = true;
      };
    };
  };
}
