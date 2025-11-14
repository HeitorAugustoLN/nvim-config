{
  flake.modules.nixvim.which-key =
    { config, lib, ... }:
    {
      plugins.which-key = {
        enable = true;

        lazyLoad.settings = {
          before = lib.nixvim.mkRaw ''
            function()
              require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
            end
          '';
          cmd = "WhichKey";
          event = "DeferredUIEnter";
        };

        settings.preset = "helix";
      };
    };
}
