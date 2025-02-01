{ lib, pkgs, ... }:
let
  allNixFilesNonDefault =
    path:
    let
      isDefaultNix = file: builtins.baseNameOf (toString file) == "default.nix";
      isNixFile = file: lib.hasSuffix ".nix" (toString file);
      groupByDirectory = files: builtins.groupBy builtins.dirOf (map toString files);
      filterDefaultNix =
        filesByDir:
        builtins.mapAttrs (
          _dir: files:
          if builtins.length files == 1 && isDefaultNix (builtins.head files) then
            files
          else
            builtins.filter (file: !isDefaultNix file) files
        ) filesByDir;
    in
    lib.pipe path [
      lib.filesystem.listFilesRecursive
      (builtins.filter isNixFile)
      groupByDirectory
      filterDefaultNix
      (filesByDir: lib.flatten (builtins.attrValues filesByDir))
      (files: map (file: /. + file) files)
    ];
in
{
  imports = allNixFilesNonDefault ./.;
  extraPackages = [ pkgs.ripgrep ];
  nixpkgs.config.allowUnfree = true;
}
