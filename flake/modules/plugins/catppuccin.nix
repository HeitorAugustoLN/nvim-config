{
  flake.modules.nixvim.catppuccin =
    { lib, ... }:
    {
      colorscheme = "catppuccin";

      colorschemes.catppuccin = {
        enable = true;
        lazyLoad.enable = true;

        settings = {
          background.dark = lib.mkDefault "mocha";
          show_end_of_buffer = true;
        };
      };
    };
}
