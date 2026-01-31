{
  description = "HeitorAugustoLN's personal Neovim configuration made with Nixvim";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./flake);

  nixConfig = {
    commit-lockfile-summary = "chore(deps): update flake";
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

    import-tree = {
      type = "github";
      owner = "vic";
      repo = "import-tree";
    };

    mnw = {
      type = "github";
      owner = "Gerg-L";
      repo = "mnw";
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
