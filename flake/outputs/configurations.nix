{ inputs, self, ... }:
{
  flake-file.inputs.nixvim = {
    type = "github";
    owner = "nix-community";
    repo = "nixvim";

    inputs = {
      flake-parts.follows = "flake-parts";
      nixpkgs.follows = "nixpkgs";
      systems.follows = "systems";
    };
  };

  imports = [ inputs.nixvim.flakeModules.default ];

  nixvim = {
    checks.enable = true;
    packages.enable = true;
  };

  perSystem =
    { self', system, ... }:
    {
      nixvimConfigurations =
        let
          modules =
            let
              languages = with self.modules.nixvim; [
                gdscript
                nix
              ];

              plugins = with self.modules.nixvim; [
                blink-cmp
                catppuccin
                conform
                lspconfig
                lz-n
                mini-ai
                mini-icons
                mini-surround
                oil
                showkeys
                treesitter
              ];
            in
            with self.modules.nixvim;
            [
              clipboard-providers
              diagnostics
              leader
              options
            ]
            ++ languages
            ++ plugins;
        in
        {
          default = self'.nixvimConfigurations.stable;

          nightly = inputs.nixvim.lib.evalNixvim {
            modules = modules ++ [ self.modules.nixvim.nightly ];
            inherit system;
          };

          stable = inputs.nixvim.lib.evalNixvim { inherit modules system; };
        };
    };
}
