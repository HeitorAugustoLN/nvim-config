{
  flake.modules.nixvim.builtConfig =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.nexus.build.builtConfig = lib.mkOption {
        type = lib.types.package;
        internal = true;
        readOnly = true;
        description = "A derivation containing both init.lua and extraFiles.";
      };

      config.nexus.build.builtConfig = pkgs.symlinkJoin {
        name = "nixvim-built-config";

        paths = [
          config.build.extraFiles
          (pkgs.runCommand "nixvim-init-source" { } ''
            mkdir -p $out
            ln -s ${config.build.initSource} $out/init.lua
          '')
        ];
      };
    };
}
