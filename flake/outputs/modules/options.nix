{
  flake.modules.nixvim.options = {
    opts = {
      cursorline = true;
      ignorecase = true;
      mouse = "a";
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      smartcase = true;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      undofile = true;
    };
  };
}
