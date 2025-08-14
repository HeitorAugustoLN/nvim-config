{
  description = "HeitorAugustoLN's personal Neovim configuration made with Nixvim";

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } { systems = [ "x86_64-linux" ]; };
}
