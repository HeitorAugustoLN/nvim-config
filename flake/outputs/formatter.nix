{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt.programs = {
    deadnix.enable = true;
    just.enable = true;
    keep-sorted.enable = true;
    nixfmt.enable = true;
    statix.enable = true;
  };
}
