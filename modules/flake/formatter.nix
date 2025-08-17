{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt.programs = {
    deadnix.enable = true;
    nixfmt.enable = true;
    statix.enable = true;

    stylua = {
      enable = true;
      settings.indent_type = "Spaces";
    };
  };
}
