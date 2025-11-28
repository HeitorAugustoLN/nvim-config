{
  flake.modules.nixvim.mini-surround = {
    plugins.mini-surround = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";

      settings.mappings = {
        add = "gsa";
        delete = "gsd";
        find = "gsf";
        find_left = "gsF";
        highlight = "gsh";
        replace = "gsr";
      };
    };
  };
}
