{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption {
    options.nexus = {
      optPlugins = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "Plugins that are loaded optionally.";
      };

      startPlugins = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [ ];
        description = "Plugins that are loaded on startup.";
      };
    };
  };
}
