{ pkgs, ... }:
{
  imports = [
    ./globals.nix
    ./options.nix
    ./performance.nix
    ./plugins/catppuccin.nix
    ./plugins/lz-n.nix
    ./plugins/mini.nix
    ./plugins/oil.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix
  ];

  extraPackages = [ pkgs.ripgrep ];
}
