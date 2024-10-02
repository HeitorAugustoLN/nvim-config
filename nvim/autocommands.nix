{
  autoCmd = [
    {
      command = "%s/\\s\\+$//e";
      desc = "Remove trailing whitespace";
      event = "BufWrite";
    }
    {
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
      desc = "Highlight when yanking text";
      event = "TextYankPost";
      group = "highlight-yank";
    }
  ];

  autoGroups = {
    highlight-yank = {
      clear = true;
    };
  };
}
