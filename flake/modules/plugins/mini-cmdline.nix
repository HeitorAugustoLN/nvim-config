{
  flake.modules.nixvim.mini-cmdline.plugins.mini-cmdline = {
    enable = true;
    lazyLoad.settings.event = "CmdlineEnter";
  };
}
