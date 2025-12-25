{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/cursorline_toggle".clear = true;

      autoCmd = [
        {
          event = [
            "BufLeave"
            "WinLeave"
          ];

          callback = lib.nixvim.mkRaw ''
            function()
              vim.wo.cursorline = false
            end
          '';

          group = "heitor/cursorline_toggle";
          desc = "Disable cursorline when leaving window";
        }
        {
          event = [
            "BufEnter"
            "WinEnter"
          ];

          callback = lib.nixvim.mkRaw ''
            function()
              vim.wo.cursorline = true
            end
          '';

          group = "heitor/cursorline_toggle";
          desc = "Enable cursorline when entering window";
        }
      ];
    };
}
