{ config, lib, ... }:
{
  options.catppuccin.flavor = lib.mkOption {
    type = lib.types.enum [
      "latte"
      "frappe"
      "macchiato"
      "mocha"
    ];
    default = "mocha";
    example = "frappe";
    description = "Catppuccin flavor to use";
  };

  config = {
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      lazyLoad.settings = {
        colorscheme = "catppuccin";
      };

      settings = {
        flavour = config.catppuccin.flavor;
        transparent_background = false;
      };
    };
  };
}
