{ inputs, ... }:
{
  flake-file.inputs.flake-parts = {
    type = "github";
    owner = "hercules-ci";
    repo = "flake-parts";
    inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  imports = [ inputs.flake-parts.flakeModules.modules ];
}
