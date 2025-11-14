{
  flake.modules.nixvim.clipboard =
    { config, ... }:
    {
      clipboard.providers.wl-copy.enable = config.waylandSupport;
    };
}
