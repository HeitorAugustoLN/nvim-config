{ inputs, ... }:
{
  flake-file.inputs.flake-file = {
    type = "github";
    owner = "vic";
    repo = "flake-file";
  };

  imports = [ inputs.flake-file.flakeModules.default ];
}
