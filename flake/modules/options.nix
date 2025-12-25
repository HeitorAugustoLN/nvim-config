{
  flake.modules.nixvim.options.opts =
    let
      indentSize = 2;
    in
    {
      breakindent = true;
      confirm = true;
      cursorline = true;
      cursorlineopt = "number";
      expandtab = true;

      fillchars = {
        fold = " ";
        foldclose = "";
        foldopen = "";
        foldsep = " ";
      };

      foldcolumn = "1";
      foldenable = true;
      foldlevel = 99;
      inccommand = "split";
      ignorecase = true;
      laststatus = 3;
      list = true;

      listchars = {
        tab = "» ";
        trail = "·";
        nbsp = "␣";
      };

      mouse = "a";
      number = true;
      pumblend = 10;
      pumheight = 10;
      relativenumber = true;
      ruler = false;
      scrolloff = 4;
      shiftround = true;
      shiftwidth = indentSize;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      smoothscroll = true;
      softtabstop = indentSize;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      tabstop = indentSize;
      termguicolors = true;
      timeoutlen = 400;
      title = true;
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
    };
}
