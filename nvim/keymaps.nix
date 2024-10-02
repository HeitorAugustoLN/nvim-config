{
  keymaps = [
    {
      action = "<cmd>nohlsearch<CR>";
      key = "<Esc>";
      mode = "n";
      options = {
        desc = "Clear search highlights";
      };
    }
    {
      action = "<C-\\><C-n>";
      key = "<Esc><Esc>";
      mode = "t";
      options = {
        desc = "Exit terminal mode";
      };
    }
    {
      action = "<C-w><C-h>";
      key = "<C-h>";
      mode = "n";
      options = {
        desc = "Move focus to the left window";
      };
    }
    {
      action = "<C-w><C-j>";
      key = "<C-j>";
      mode = "n";
      options = {
        desc = "Move focus to the lower window";
      };
    }
    {
      action = "<C-w><C-k>";
      key = "<C-k>";
      mode = "n";
      options = {
        desc = "Move focus to the upper window";
      };
    }
    {
      action = "<C-w><C-l>";
      key = "<C-l>";
      mode = "n";
      options = {
        desc = "Move focus to the right window";
      };
    }
  ];
}
