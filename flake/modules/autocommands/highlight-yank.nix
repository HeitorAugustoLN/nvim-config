{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/highlight_yank".clear = true;

      autoCmd = [
        {
          event = "TextYankPost";

          callback = lib.nixvim.mkRaw ''
            function()
              vim.hl.on_yank()
            end
          '';

          group = "heitor/highlight_yank";
          desc = "Highlight when yanking text";
        }
      ];
    };
}
