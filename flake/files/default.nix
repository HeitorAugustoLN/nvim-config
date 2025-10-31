{ inputs, ... }:
{
  flake-file.inputs.files = {
    type = "github";
    owner = "mightyiam";
    repo = "files";
  };

  imports = [ inputs.files.flakeModules.default ];
}
