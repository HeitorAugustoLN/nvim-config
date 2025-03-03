{ pkgs, ... }:
{
  imports = [
    ./autocommands.nix
    ./globals.nix
    ./options.nix
    ./performance.nix
    ./plugins
  ];

  extraPackages = [ pkgs.ripgrep ];
  nixpkgs.config.allowUnfree = true;
}
