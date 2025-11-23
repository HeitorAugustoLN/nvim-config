{
  flake.modules.nixvim.mini-statusline = {
    plugins.mini-statusline = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
