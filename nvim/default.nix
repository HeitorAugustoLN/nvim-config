{
  inputs,
  system,
  pkgs,
  ...
}:
{
  imports = [
    ./globals.nix
  ];

  extraPackages = [ pkgs.ripgrep ];

  viAlias = true;
  vimAlias = true;

  nixpkgs.pkgs = import inputs.nixpkgs {
    inherit system;

    config = {
      allowUnfree = true;
    };
  };
}
