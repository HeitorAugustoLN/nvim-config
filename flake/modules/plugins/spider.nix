{
  flake.modules.nixvim.spider =
    { config, lib, ... }:
    {
      plugins = {
        spider = {
          enable = true;
          lazyLoad.settings.lazy = true;
          settings.skipInsignificantPunctuation = false;
        };

        lz-n.keymaps =
          map
            (
              keymap:
              keymap
              // {
                plugin = lib.getName config.plugins.spider.package;
                mode = [
                  "n"
                  "o"
                  "x"
                ];
              }
            )
            [
              {
                key = "<A-b>";
                action = "<cmd>lua require('spider').motion('b')<CR>";
                options.desc = "Spider motion (word backward)";
              }
              {
                key = "<A-e>";
                action = "<cmd>lua require('spider').motion('e')<CR>";
                options.desc = "Spider motion (word end)";
              }
              {
                key = "<A-E>";
                action = "<cmd>lua require('spider').motion('ge')<CR>";
                options.desc = "Spider motion (end of previous word)";
              }
              {
                key = "<A-w>";
                action = "<cmd>lua require('spider').motion('w')<CR>";
                options.desc = "Spider motion (word forward)";
              }
            ];
      };
    };
}
