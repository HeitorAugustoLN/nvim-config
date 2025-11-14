{
  flake.modules.nixvim.mini-statusline =
    { config, lib, ... }:
    {
      plugins.mini-statusline = {
        enable = true;

        lazyLoad.settings = {
          before = lib.nixvim.mkRaw ''
            function()
              require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
            end
          '';
          event = "DeferredUIEnter";
        };
      };
    };
}
