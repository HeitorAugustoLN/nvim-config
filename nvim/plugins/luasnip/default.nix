{
  plugins.luasnip = {
    enable = true;
    lazyLoad.settings.lazy = true;

    fromLua = [
      {
        paths = builtins.path {
          name = "neovim-snippets";
          path = ./snippets;
        };
      }
    ];

    settings = {
      delete_check_events = "TextChanged";
      history = true;
    };
  };
}
