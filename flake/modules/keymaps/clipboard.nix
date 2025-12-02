{
  flake.modules.nixvim.keymaps.keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = ''"+y'';
      options.desc = "Yank to clipboard";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>Y";
      action = ''"+y$'';
      options.desc = "Yank to end of line to clipboard";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>p";
      action = ''"+p'';
      options.desc = "Paste from clipboard after cursor";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>P";
      action = ''"+P'';
      options.desc = "Paste from clipboard before cursor";
    }
  ];
}
