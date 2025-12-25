{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/resize_splits".clear = true;

      autoCmd = [
        {
          event = "VimResized";

          callback = lib.nixvim.mkRaw ''
            function()
              local current_tab = vim.fn.tabpagenr()
              vim.cmd("tabdo wincmd =")
              vim.cmd("tabnext " .. current_tab)
            end
          '';

          group = "heitor/resize_splits";
          desc = "Resize splits when Vim is resized";
        }
      ];
    };
}
