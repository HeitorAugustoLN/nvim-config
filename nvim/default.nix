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
    ./plugins/conform.nix
    ./plugins/lint.nix
    ./plugins/lz-n.nix
    ./plugins/mini.nix
    ./plugins/oil.nix
    ./plugins/treesitter.nix
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
