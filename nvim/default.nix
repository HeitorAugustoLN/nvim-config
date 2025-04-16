{ pkgs, ... }:
{
  imports = [
    ./globals.nix
    ./options.nix
    ./plugins/catppuccin.nix
    ./plugins/lz-n.nix
    ./plugins/oil.nix
  ];

  extraPackages = [ pkgs.ripgrep ];
}
