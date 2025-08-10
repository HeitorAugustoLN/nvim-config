{ config, inputs, ... }:
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
    let
      modules = with config.flake.modules.nixvim; [
        byteCompileLua
        combinePlugins
        diagnostic
        leader
        lineNumbers
        luaLoader
        lz-n
        oil
      ];
    in
    {
      nixvimConfigurations = {
        default = self'.nixvimConfigurations.stable;

        stable = inputs.nixvim.lib.evalNixvim { inherit modules system; };

        nightly = inputs.nixvim.lib.evalNixvim {
          inherit system;
          modules = modules ++ [ config.flake.modules.nixvim.nightly ];
        };
      };
    };
}
