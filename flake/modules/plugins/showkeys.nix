{
  flake.modules.nixvim.showkeys = {
    plugins.showkeys = {
      enable = true;
      lazyLoad.settings.cmd = "ShowkeysToggle";

      settings = {
        maxkeys = 8;
        position = "bottom-center";
        winopts.border = "rounded";
      };
    };
  };
}
