{ inputs, ... }:
{
  flake-file.inputs.treefmt-nix = {
    type = "github";
    owner = "numtide";
    repo = "treefmt-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt.programs = {
    deadnix.enable = true;
    just.enable = true;
    keep-sorted.enable = true;
    nixfmt.enable = true;
    prettier.enable = true;
    statix.enable = true;
  };
}
