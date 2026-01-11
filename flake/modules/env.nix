{ self, ... }:
{
  flake.modules.nixvim.env =
    { config, ... }:
    {
      env = {
        NIXVIM_CONFIG = self.outPath;
        NIXVIM_BUILT_CONFIG = config.nexus.build.builtConfig;
        NIXVIM_EXTRA_FILES = config.build.extraFiles;
        NIXVIM_INIT_SOURCE = config.build.initSource;
      };
    };
}
