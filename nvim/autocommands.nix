{
  autoCmd = [
    {
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
      desc = "Highlight when yanking";
      event = "TextYankPost";
      group = "highlight-yank";
    }

    {
      callback.__raw = ''
        function(event)
          if event.match:match("^%w%w+:[\\/][\\/]") then
            return
          end
          local file = vim.uv.fs_realpath(event.match) or event.match
          vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
        end
      '';
      desc = "Automatically create directories when saving a file, in case a intermediate directory does not exist";
      event = "BufWritePre";
      group = "auto-create-directories";
    }
  ];

  autoGroups = {
    auto-create-directories.clear = true;
    highlight-yank.clear = true;
  };
}
