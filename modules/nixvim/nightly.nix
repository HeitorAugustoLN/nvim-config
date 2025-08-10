{ inputs, ... }:
{
  flake-file.inputs.neovim-nightly-overlay = {
    type = "github";
    owner = "nix-community";
    repo = "neovim-nightly-overlay";
    inputs = {
      flake-compat.follows = "flake-compat";
      flake-parts.follows = "flake-parts";
      git-hooks.follows = "git-hooks";
      nixpkgs.follows = "nixpkgs";
      treefmt-nix.follows = "treefmt-nix";
    };
  };

  flake.modules.nixvim.nightly =
    { pkgs, ... }:
    let
      inherit (pkgs.stdenv.hostPlatform) system;
    in
    {
      package = inputs.neovim-nightly-overlay.packages.${system}.neovim;
    };
}
