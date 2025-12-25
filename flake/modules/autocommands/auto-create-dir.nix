{
  flake.modules.nixvim.autoCommands =
    { lib, ... }:
    {
      autoGroups."heitor/auto_create_dir".clear = true;

      autoCmd = [
        {
          event = "BufWritePre";

          callback = lib.nixvim.mkRaw ''
            function(event)
              if event.match:match("^%w%w+:[\\/][\\/]") then
                return
              end
              local file = vim.uv.fs_realpath(event.match) or event.match
              vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
            end
          '';

          group = "heitor/auto_create_dir";
          desc = "Auto create directory when saving a file";
        }
      ];
    };
}
