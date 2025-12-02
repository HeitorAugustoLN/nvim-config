{
  flake.modules.nixvim.autopairs.plugins.nvim-autopairs = {
    enable = true;
    lazyLoad.settings.event = "InsertEnter";
  };
}
