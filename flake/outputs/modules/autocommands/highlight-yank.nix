{
  flake.modules.nixvim.highlightYank =
    { lib, ... }:
    {
      autoGroups.highlight_yank.clear = true;

      autoCmd = [
        {
          callback = lib.nixvim.mkRaw ''
            function()
              vim.hl.on_yank()
            end
          '';
          desc = "Highlight when yanking text";
          event = "TextYankPost";
          group = "highlight_yank";
        }
      ];
    };
}
