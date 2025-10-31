# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  description = "HeitorAugustoLN's personal Neovim configuration made with Nixvim";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./flake);

  nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];
    extra-substituters = [ "https://heitor.cachix.org" ];
    extra-trusted-public-keys = [ "heitor.cachix.org-1:IZ1ydLh73kFtdv+KfcsR4WGPkn+/I926nTGhk9O9AxI=" ];
  };

  inputs = {
    files = {
      owner = "mightyiam";
      repo = "files";
      type = "github";
    };
    flake-compat = {
      owner = "edolstra";
      repo = "flake-compat";
      type = "github";
    };
    flake-file = {
      owner = "vic";
      repo = "flake-file";
      type = "github";
    };
    flake-parts = {
      inputs = {
        nixpkgs-lib = {
          follows = "nixpkgs";
        };
      };
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
    neovim-nightly-overlay = {
      inputs = {
        flake-parts = {
          follows = "flake-parts";
        };
        nixpkgs = {
          follows = "nixpkgs";
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
    nixvim = {
      inputs = {
        flake-parts = {
          follows = "flake-parts";
        };
        nixpkgs = {
          follows = "nixpkgs";
        };
        systems = {
          follows = "systems";
        };
      };
      owner = "nix-community";
      repo = "nixvim";
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
