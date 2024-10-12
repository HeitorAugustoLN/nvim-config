{ inputs, system, ... }:
{
  imports = [
    ./autocommands.nix
    ./filetypes.nix
    ./keymaps.nix
    ./options.nix
    ./performance.nix

    ./plugins/todo-comments.nix
    ./plugins/which-key.nix
  ];

  nixpkgs.pkgs = import inputs.nixpkgs {
    inherit system;

    config.allowUnfree = true;
  };
}
