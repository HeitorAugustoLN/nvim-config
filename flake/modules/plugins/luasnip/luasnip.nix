{
  flake.modules.nixvim.luasnip.plugins.luasnip = {
    enable = true;

    lazyLoad.settings = {
      cmd = [
        "LuaSnipListAvailable"
        "LuaSnipUnlinkCurrent"
      ];
      lazy = true;
    };

    fromLua = [
      {
        paths = builtins.path {
          name = "neovim-snippets";
          path = ./_snippets;
        };
      }
    ];

    settings = {
      delete_check_events = "TextChanged";
      history = true;
    };
  };
}
