{
  flake.modules.nixvim.mini-ai.plugins.mini-ai = {
    enable = true;
    lazyLoad.settings.event = "DeferredUIEnter";
    settings.n_lines = 500;
  };
}
