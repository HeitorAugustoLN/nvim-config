{
  inputs,
  system,
  pkgs,
  ...
}:
{
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
