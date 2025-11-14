{
  flake.modules.nixvim.catppuccin = {
    colorscheme = "catppuccin";

    colorschemes.catppuccin = {
      enable = true;
      lazyLoad.enable = true;
      settings.show_end_of_buffer = true;
    };
  };
}
