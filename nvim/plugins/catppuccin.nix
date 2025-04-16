{ config, lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.catppuccin.flavor = mkOption {
    type = types.enum [
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
      lazyLoad.enable = true;

      settings = {
        flavour = config.catppuccin.flavor;
        integrations.blink_cmp = config.plugins.blink-cmp.enable;
        transparent_background = false;
      };
    };
  };
}
