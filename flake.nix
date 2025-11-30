{
  description = "HeitorAugustoLN's personal Neovim configuration made with Nixvim";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./flake);

  nixConfig = {
    extra-experimental-features = [ "pipe-operators" ];
    extra-substituters = [ "https://heitor.cachix.org" ];
    extra-trusted-public-keys = [ "heitor.cachix.org-1:IZ1ydLh73kFtdv+KfcsR4WGPkn+/I926nTGhk9O9AxI=" ];
  };

  inputs = {
    # keep-sorted start block=yes newline_separated=yes
    flake-compat = {
      type = "github";
      owner = "NixOS";
      repo = "flake-compat";
    };

    flake-parts = {
      type = "github";
      owner = "hercules-ci";
      repo = "flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    gen-luarc = {
      type = "github";
      owner = "mrcjkb";
      repo = "nix-gen-luarc-json";

      inputs = {
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
        nixpkgs.follows = "nixpkgs";
      };
    };

    git-hooks = {
      type = "github";
      owner = "cachix";
      repo = "git-hooks.nix";

      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };

    import-tree = {
      type = "git";
      url = "https://tangled.org/oeiuwq.com/import-tree";
    };

    neovim-nightly-overlay = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    nixvim = {
      type = "github";
      owner = "nix-community";
      repo = "nixvim";
      ref = "pull/3993/head"; # TODO: Remove after gets merged.

      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nuschtosSearch.follows = "";
        systems.follows = "systems";
      };
    };

    systems = {
      type = "github";
      owner = "nix-systems";
      repo = "default";
    };

    treefmt-nix = {
      type = "github";
      owner = "numtide";
      repo = "treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };
}
