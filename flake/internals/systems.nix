{ inputs, ... }:
{
  flake-file.inputs.systems = {
    type = "github";
    owner = "nix-systems";
    repo = "default";
  };

  systems = import inputs.systems;
}
