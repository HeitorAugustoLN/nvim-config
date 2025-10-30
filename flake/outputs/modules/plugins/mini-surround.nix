{
  flake.modules.nixvim.mini-surround = {
    plugins.mini-surround = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
