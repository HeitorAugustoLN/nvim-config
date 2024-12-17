{
  config,
  lib,
  pkgs,
  ...
}:
{
  clipboard = {
    providers = {
      wl-copy.enable = true;
      xsel.enable = true;
    };
    register.__raw = ''vim.env.SSH_TTY and "" or "unnamedplus"'';
  };

  opts =
    let
      indentSize = 2;
    in
    {
      backup = false;
      breakindent = true;
      completeopt = "menu,menuone,noselect";
      cursorline = true;
      expandtab = true;
      fillchars = {
        eob = " ";
        fold = " ";
        foldclose = "";
        foldopen = "";
        foldsep = " ";
      };
      foldcolumn = "1";
      foldenable = true;
      foldlevel = 99;
      foldlevelstart = 99;
      ignorecase = true;
      inccommand = "split";
      laststatus = 3;
      linebreak = true;
      list = true;
      listchars = {
        nbsp = "␣";
        tab = "» ";
        trail = "·";
      };
      mouse = "a";
      number = true;
      pumblend = 10;
      pumheight = 10;
      relativenumber = true;
      ruler = false;
      scrolloff = 4;
      shiftwidth = indentSize;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      softtabstop = indentSize;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      swapfile = false;
      tabstop = indentSize;
      termguicolors = true;
      timeoutlen = 300;
      title = true;
      titlestring = "%m %{expand('%:p') == '' || expand('%:p') == expand('%:p:h') . '/' ? '' : fnamemodify(expand('%'), ':~:.') . ' - '} %{stridx(expand('%:p'), getcwd()) == 0 ? fnamemodify(getcwd(), ':t') . ' - ' : ''} %{mode() == 'n' ? 'NORMAL' : mode() == 'i' ? 'INSERT' : mode() == 'v' ? 'VISUAL' : mode() == 'V' ? 'VISUAL LINE' : mode() == 'R' ? 'REPLACE' : mode() == 's' ? 'SELECT' : mode() == 't' ? 'TERMINAL' : mode()} | Neovim";
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      wrap = false;
    }
    // lib.optionalAttrs (builtins.elem pkgs.ripgrep config.extraPackages) {
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
    }
    // lib.optionalAttrs config.plugins.conform-nvim.enable {
      formatexpr = "v:lua.require'conform'.formatexpr()";
    };
}
