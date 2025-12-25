{
  flake.modules.nixvim.blink-cmp.plugins.blink-cmp = {
    enable = true;
    lazyLoad.settings.event = "InsertEnter";

    settings = {
      cmdline.enabled = false;
      signature.enabled = true;
    };
  };
}
