{
  flake.modules.nixvim.mini-surround =
    { config, ... }:
    {
      plugins.mini-surround = {
        enable = true;
        lazyLoad.settings.keys = builtins.attrValues config.plugins.mini-surround.settings.mappings;

        settings.mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
        };
      };
    };
}
