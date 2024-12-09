{
  plugins.oil = {
    enable = true;

    settings = {
      skip_confirm_for_simple_edits = true;
      view_options = {
        show_hidden = true;
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
