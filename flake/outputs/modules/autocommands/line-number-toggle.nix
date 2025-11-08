{
  flake.modules.nixvim.lineNumberToggle =
    { lib, ... }:
    {
      autoGroups.line_number_toggle.clear = true;

      autoCmd = [
        {
          callback = lib.nixvim.mkRaw ''
            function()
              vim.o.relativenumber = false
            end
          '';
          desc = "Switch to absolute line numbers when in insert mode or unfocused";
          event = [
            "BufLeave"
            "CmdlineEnter"
            "FocusLost"
            "InsertEnter"
            "WinLeave"
          ];
          group = "line_number_toggle";
          pattern = "*";
        }
        {
          callback = lib.nixvim.mkRaw ''
            function()
              if vim.fn.mode() ~= "i" then
                vim.o.relativenumber = true
              end
            end
          '';
          desc = "Switch to relative line numbers when in normal mode and focused";
          event = [
            "BufEnter"
            "CmdlineLeave"
            "FocusGained"
            "InsertLeave"
            "WinEnter"
          ];
          group = "line_number_toggle";
          pattern = "*";
        }
      ];
    };
}
