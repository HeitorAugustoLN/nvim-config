{
  flake.modules.nixvim.blink-cmp = {
    plugins.blink-cmp = {
      enable = true;

      lazyLoad.settings.event = [
        "CmdlineEnter"
        "InsertEnter"
      ];

      settings.signature.enabled = true;
    };
  };
}
