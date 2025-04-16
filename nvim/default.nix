{ pkgs, ... }:
{
  imports = [
    ./globals.nix
    ./options.nix
    ./plugins/catppuccin.nix
    ./plugins/lz-n.nix
    ./plugins/mini.nix
    ./plugins/oil.nix
    ./plugins/treesitter.nix
  ];

  extraPackages = [ pkgs.ripgrep ];
}
