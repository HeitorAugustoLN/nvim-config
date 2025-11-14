{
  flake.modules.nixvim.blink-indent = {
    plugins.blink-indent = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
