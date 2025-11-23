{
  flake.modules.nixvim.catppuccin =
    { pkgs, ... }:
    {
      colorscheme = "catppuccin";

      colorschemes.catppuccin = {
        enable = true;
        lazyLoad.enable = true;

        package = pkgs.vimUtils.buildVimPlugin {
          pname = "catppuccin-nvim";
          version = "2025-11-14";

          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "nvim";
            rev = "pull/953/head";
            hash = "sha256-dA59LyrBaRb1qT6ARPGd9grCFs213AZ1E8MioKiKRO4=";
          };

          nvimSkipModules = [
            "catppuccin.groups.integrations.noice"
            "catppuccin.groups.integrations.feline"
            "catppuccin.lib.vim.init"
          ];
        };
      };
    };
}
