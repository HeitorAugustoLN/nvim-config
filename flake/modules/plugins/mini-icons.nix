{
  flake.modules.nixvim.mini-icons = {
    plugins.mini-icons = {
      enable = true;
      lazyLoad.settings.lazy = true;
      mockDevIcons = true;
    };
  };
}
