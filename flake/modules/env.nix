{
  flake.modules.nixvim.env =
    { config, ... }:
    {
      env.NIXVIM_INIT_SOURCE = config.build.initSource;
    };
}
