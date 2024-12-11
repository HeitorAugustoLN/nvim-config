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
    ./plugins/lz-n.nix
    ./plugins/oil.nix
    ./plugins/treesitter.nix
    ./plugins/web-devicons.nix
    ./plugins/which-key.nix
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
