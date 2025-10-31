{ inputs, ... }:
{
  flake-file.inputs.neovim-nightly-overlay = {
    type = "github";
    owner = "nix-community";
    repo = "neovim-nightly-overlay";

    inputs = {
      flake-parts.follows = "flake-parts";
      nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixvim.nightly =
    { pkgs, ... }:
    {
      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
    };
}
