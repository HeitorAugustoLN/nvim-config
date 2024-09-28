{
  description = "HeitorAugustoLN's personal Neovim configuration flake made with Nixvim";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";

        devshell.follows = "";
        flake-compat.follows = "";
        git-hooks.follows = "";
        home-manager.follows = "";
        nix-darwin.follows = "";
        nuschtosSearch.follows = "";
        treefmt-nix.follows = "";
      };
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";

        flake-compat.follows = "";
        git-hooks.follows = "";
        hercules-ci.follows = "";
      };
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          inputs',
          pkgs,
          self',
          system,
          ...
        }:
        let
          nixvim = inputs.nixvim.legacyPackages.${system};
          nixvimLib = inputs.nixvim.lib.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./nvim;
            extraSpecialArgs = { };
          };
          nvim = nixvim.makeNixvimWithModule nixvimModule;
        in
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;

            config.allowUnfree = true;
          };

          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          formatter = pkgs.nixfmt-rfc-style;

          packages = {
            default = self'.packages.nvim;
            inherit nvim;
            nvim-nightly = nvim.extend {
              package = inputs'.neovim-nightly.packages.neovim;
            };
          };
        };
    };
}
