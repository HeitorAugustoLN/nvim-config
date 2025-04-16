{
  plugins.oil = {
    enable = true;

    lazyLoad.settings = {
      before.__raw = ''
        function()
          require("lz.n").trigger_load("mini.nvim")
        end
      '';

      cmd = "Oil";
      event = "DeferredUIEnter";
      keys = [ "-" ];
      lazy.__raw = "vim.fn.argc(-1) == 0";
    };

    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;

      view_options = {
        natural_order = true;
        show_hidden = true;
      };

      win_options.wrap = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>Oil<CR>";
      key = "-";
      mode = "n";
      options.desc = "Open parent directory";
    }
  ];
}
