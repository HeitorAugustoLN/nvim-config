{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/cursorline_toggle".clear = true;

      autoCmd = [
        {
          callback = lib.nixvim.mkRaw ''
            function()
              vim.wo.cursorline = false
            end
          '';
          desc = "Disable cursorline when leaving window";
          event = [
            "BufLeave"
            "WinLeave"
          ];
          group = "heitor/cursorline_toggle";
        }
        {
          callback = lib.nixvim.mkRaw ''
            function()
              vim.wo.cursorline = true
            end
          '';
          desc = "Enable cursorline when entering window";
          event = [
            "BufEnter"
            "WinEnter"
          ];
          group = "heitor/cursorline_toggle";
        }
      ];
    };
}
