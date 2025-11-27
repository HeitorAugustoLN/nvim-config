{
  flake.modules.nixvim.mini-move = {
    plugins.mini-move = {
      enable = true;
      lazyLoad.settings.event = "BufReadPre";
    };
  };
}
