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
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim = {
      # url = "github:nix-community/nixvim";
      url = "github:HeitorAugustoLN/nixvim/lsp-migrate";
      inputs = {
        devshell.follows = "";
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "";
        home-manager.follows = "";
        nixpkgs.follows = "nixpkgs";
        nix-darwin.follows = "";
        nuschtosSearch.follows = "";
        treefmt-nix.follows = "treefmt-nix";
      };
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Remove this input after nvim-neorocks/lz.n#122 is merged
    # And lz.n gets updated in nixpkgs.
    #
    # This PR makes setting `lazy = false` with other lazy handlers set up possible.
    lz-n = {
      url = "github:zoriya/lz.n/master";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
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

      imports = [ inputs.treefmt-nix.flakeModule ];

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
              inherit inputs inputs' system;
            };
          };
        in
        {
          checks = {
            default = self'.checks.nvim;
            nvim = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          devShells = {
            default = self'.devShells.nvim;
            nvim = pkgs.mkShell {
              strictDeps = true;

              nativeBuildInputs = [ self'.packages.nvim ];
            };
            nvim-nightly = pkgs.mkShell {
              strictDeps = true;

              nativeBuildInputs = [ self'.packages.nvim-nightly ];
            };
          };

          packages = {
            default = self'.packages.nvim;
            nvim = nixvim.makeNixvimWithModule nixvimModule;
            nvim-nightly = self'.packages.nvim.extend {
              package = inputs'.neovim-nightly.packages.neovim;
            };
          };

          treefmt = {
            flakeCheck = true;
            projectRootFile = "flake.nix";

            programs = {
              deadnix.enable = true;
              deno.enable = true; # For markdown
              nixfmt.enable = true;
              statix.enable = true;
              stylua.enable = true;
              taplo.enable = true;
            };
          };
        };
    };
}
