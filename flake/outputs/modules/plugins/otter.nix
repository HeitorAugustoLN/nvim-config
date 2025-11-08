{
  flake.modules.nixvim.otter = {
    plugins.otter = {
      enable = true;
      lazyLoad.settings.event = "LspAttach";
    };
  };
}
