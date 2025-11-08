{
  flake.modules.nixvim.dap = {
    plugins.dap = {
      enable = true;
      lazyLoad.settings.lazy = true;
    };
  };
}
