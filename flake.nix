# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  description = "HeitorAugustoLN's personal Neovim configuration";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    flake-compat = {
      owner = "edolstra";
      repo = "flake-compat";
      type = "github";
    };
    flake-file = {
      owner = "vic";
      ref = "pull/27/head";
      repo = "flake-file";
      type = "github";
    };
    flake-parts = {
      owner = "hercules-ci";
      repo = "flake-parts";
      type = "github";
    };
    git-hooks = {
      inputs = {
        flake-compat = {
          follows = "flake-compat";
        };
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
      owner = "cachix";
      repo = "git-hooks.nix";
      type = "github";
    };
    import-tree = {
      owner = "vic";
      repo = "import-tree";
      type = "github";
    };
    mnw = {
      owner = "Gerg-L";
      repo = "mnw";
      type = "github";
    };
    neovim-nightly-overlay = {
      inputs = {
        flake-compat = {
          follows = "flake-compat";
        };
        flake-parts = {
          follows = "flake-parts";
        };
        git-hooks = {
          follows = "git-hooks";
        };
        nixpkgs = {
          follows = "nixpkgs";
        };
        treefmt-nix = {
          follows = "treefmt-nix";
        };
      };
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      type = "github";
    };
    nixpkgs = {
      owner = "NixOS";
      ref = "nixpkgs-unstable";
      repo = "nixpkgs";
      type = "github";
    };
    systems = {
      owner = "nix-systems";
      repo = "default";
      type = "github";
    };
    treefmt-nix = {
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
      owner = "numtide";
      repo = "treefmt-nix";
      type = "github";
    };
  };

}
