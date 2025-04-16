{ pkgs, ... }:
{
  clipboard.providers = {
    wl-copy = {
      enable = true;
      package = pkgs.wl-clipboard-rs;
    };

    xsel.enable = true;
  };

  opts =
    let
      indentSize = 2;
    in
    {
      completeopt = "menu,menuone,noselect";
      confirm = true;
      cursorline = true;
      cursorlineopt = "number";
      expandtab = true;
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
      relativenumber = true;
      ruler = false;
      scrolloff = 4;
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
      undofile = true;
      undolevels = 10000;
      updatetime = 250;
      tabstop = indentSize;
      termguicolors = true;
      timeoutlen = 300;
    };
}
