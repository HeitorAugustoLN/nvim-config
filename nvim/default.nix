{
  inputs,
  system,
  pkgs,
  ...
}:
{
  imports = [
    ./globals.nix
    ./options.nix

    ./plugins/catppuccin.nix
    ./plugins/oil.nix
    ./plugins/treesitter.nix
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
