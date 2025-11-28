{
  flake.modules.nixvim.mini-move = {
    plugins.mini-move = {
      enable = true;
      lazyLoad.settings.keys = [
        "<M-h>"
        "<M-j>"
        "<M-k>"
        "<M-l>"
      ];
    };
  };
}
