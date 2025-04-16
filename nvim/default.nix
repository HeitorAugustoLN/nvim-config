{ pkgs, ... }:
{
  imports = [
    ./plugins/catppuccin.nix
    ./plugins/lz-n.nix
  ];

  extraPackages = [ pkgs.ripgrep ];
}
