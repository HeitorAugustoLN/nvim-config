{
  flake.modules.nixvim.fzf-lua =
    { config, lib, ... }:
    {
      plugins = {
        fzf-lua = {
          enable = true;

          lazyLoad.settings = {
            before = lib.nixvim.mkRaw ''
              function()
                require("lz.n").trigger_load("${lib.getName config.plugins.mini-icons.package}")
              end
            '';
            cmd = "FzfLua";
          };

          settings.files.file_ignore_patterns = [ ".direnv" ];
        };

        lz-n.keymaps =
          map
            (
              keymap:
              keymap
              // {
                plugin = lib.getName config.plugins.fzf-lua.package;
                mode = "n";
              }
            )
            [
              {
                key = "<leader>sf";
                action = "<cmd>FzfLua files<CR>";
                options.desc = "Search files";
              }
              {
                key = "<leader>sr";
                action = "<cmd>FzfLua resume<CR>";
                options.desc = "Resume last picker";
              }
            ];

        mini-clue.settings.clues = [
          {
            mode = "n";
            keys = "<leader>s";
            desc = "+search";
          }
        ];
      };
    };
}
