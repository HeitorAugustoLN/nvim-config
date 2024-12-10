{
  description = "HeitorAugustoLN's personal Neovim configuration made with Nixvim";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "";
        hercules-ci-effects.follows = "";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "";
      };
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        devshell.follows = "";
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "";
        home-manager.follows = "";
        nixpkgs.follows = "nixpkgs";
        nix-darwin.follows = "";
        nuschtosSearch.follows = "";
        treefmt-nix.follows = "";
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
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
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
            module = import ./nvim;
            extraSpecialArgs = {
              inherit inputs system;
            };
          };
        in
        {
          checks = {
            default = self'.checks.nvim;
            nvim = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          devShells =
            let
              formatters = with pkgs; [
                nixfmt-rfc-style
                stylua
              ];
            in
            {
              default = self'.devShells.nvim;
              nvim = pkgs.mkShell {
                strictDeps = true;

                nativeBuildInputs = [
                  formatters
                  self'.packages.nvim
                ];
              };
              nvim-nightly = pkgs.mkShell {
                strictDeps = true;

                nativeBuildInputs = [
                  formatters
                  self'.packages.nvim-nightly
                ];
              };
            };

          formatter = pkgs.treefmt;

          packages = {
            default = self'.packages.nvim;
            nvim = nixvim.makeNixvimWithModule nixvimModule;
            nvim-nightly = self'.packages.nvim.extend {
              package = inputs'.neovim-nightly.packages.neovim;
            };
          };
        };
    };
}
