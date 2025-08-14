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
    flake-file = {
      owner = "vic";
      repo = "flake-file";
      type = "github";
    };
    flake-parts = {
      owner = "hercules-ci";
      repo = "flake-parts";
      type = "github";
    };
    import-tree = {
      owner = "vic";
      repo = "import-tree";
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
  };

}
