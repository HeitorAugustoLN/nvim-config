{
  flake.modules.nixvim.catppuccin =
    { config, lib, ... }:
    {
      options.nexus.catppuccin = {
        flavor = lib.mkOption {
          type = lib.types.enum [
            "latte"
            "frappe"
            "macchiato"
            "mocha"
          ];
          default = "mocha";
          example = "latte";
          description = "Catppuccin flavor.";
        };
      };

      config =
        let
          cfg = config.nexus.catppuccin;
        in
        {
          colorscheme = "catppuccin";

          colorschemes.catppuccin = {
            enable = true;
            lazyLoad.enable = config.plugins.lz-n.enable;
            settings.background.dark = cfg.flavor;
          };
        };
    };
}
