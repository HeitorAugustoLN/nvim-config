{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/line_number_toggle".clear = true;

      autoCmd = [
        {
          callback = lib.nixvim.mkRaw ''
            function(args)
              if vim.wo.number then
                vim.wo.relativenumber = false
              end

              -- Redraw here to avoid having to first write something for the line numbers to update.
              if args.event == "CmdlineEnter" then
                if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
                    vim.cmd.redraw()
                end
              end
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
          group = "heitor/line_number_toggle";
        }
        {
          callback = lib.nixvim.mkRaw ''
            function()
              if vim.wo.number and not vim.startswith(vim.api.nvim_get_mode().mode, "i") then
                vim.wo.relativenumber = true
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
          group = "heitor/line_number_toggle";
        }
      ];
    };
}
