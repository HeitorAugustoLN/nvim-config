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
      stylua = {
        enable = true;
        settings = {
          call_parentheses = "Always";
          collapse_simple_statement = "Never";
          column_width = 120;
          indent_type = "Spaces";
          indent_width = 2;
          line_endings = "Unix";
          quote_style = "AutoPreferDouble";
        };
      };
      taplo.enable = true;
    };

    projectRootFile = "flake.nix";
  };
}
