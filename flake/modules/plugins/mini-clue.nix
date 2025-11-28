{
  flake.modules.nixvim.mini-clue =
    { lib, ... }:
    {
      plugins.mini-clue = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";

        settings = {
          clues = map (name: lib.nixvim.mkRaw "require('mini.clue').gen_clues.${name}()") [
            "builtin_completion"
            "g"
            "marks"
            "registers"
            "windows"
            "z"
          ];

          triggers = [
            # Leader
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "x";
              keys = "<Leader>";
            }

            # Built-in completion
            {
              mode = "i";
              keys = "<C-x>";
            }

            # `g` key
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "x";
              keys = "g";
            }

            # Marks
            {
              mode = "n";
              keys = "'";
            }
            {
              mode = "n";
              keys = "`";
            }
            {
              mode = "x";
              keys = "'";
            }
            {
              mode = "x";
              keys = "`";
            }

            # Registers
            {
              mode = "n";
              keys = ''"'';
            }
            {
              mode = "x";
              keys = ''"'';
            }
            {
              mode = "i";
              keys = "<C-r>";
            }
            {
              mode = "c";
              keys = "<C-r>";
            }

            # Window commands
            {
              mode = "n";
              keys = "<C-w>";
            }

            # `z` key
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "x";
              keys = "z";
            }
          ];
        };
      };
    };
}
