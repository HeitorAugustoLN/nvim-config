{ inputs, ... }:
{
  flake-file.inputs.flake-file = {
    type = "github";
    owner = "vic";
    repo = "flake-file";
    ref = "pull/27/head";
  };

  imports = [ inputs.flake-file.flakeModules.default ];
}
