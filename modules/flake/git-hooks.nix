{ inputs, ... }:
{
  flake-file.inputs.git-hooks = {
    type = "github";
    owner = "cachix";
    repo = "git-hooks.nix";
    inputs = {
      flake-compat.follows = "flake-compat";
      nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [ inputs.git-hooks.flakeModule ];

  perSystem.pre-commit = {
    check.enable = true;
    settings.hooks.treefmt.enable = true;
  };
}
