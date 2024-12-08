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
      settings = {
        background = {
          dark = config.catppuccin.flavor;
          light = "latte";
        };
        flavour = "auto";
        transparent_background = false;
      };
    };
  };
}
