{
  flake.modules.nixvim.options = {
    opts =
      let
        indentSize = 2;
      in
      {
        confirm = true;
        cursorline = true;
        expandtab = true;
        ignorecase = true;
        laststatus = 3;
        mouse = "a";
        number = true;
        relativenumber = true;
        ruler = false;
        scrolloff = 4;
        shiftwidth = indentSize;
        sidescrolloff = 8;
        signcolumn = "yes";
        smartcase = true;
        smartindent = true;
        softtabstop = indentSize;
        splitbelow = true;
        splitkeep = "screen";
        splitright = true;
        timeoutlen = 400;
        undofile = true;
        updatetime = 200;
        tabstop = indentSize;
      };
  };
}
