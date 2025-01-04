{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt = {
    flakeCheck = true;

    programs = {
      deadnix.enable = true;
      deno.enable = true; # For markdown files
      nixfmt.enable = true;
      statix.enable = true;
      stylua.enable = true;
      taplo.enable = true;
    };

    projectRootFile = "flake.nix";
  };
}
