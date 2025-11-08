{
  flake.modules.nixvim.options = {
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      ignorecase = true;
      signcolumn = "yes";
      smartcase = true;
    };
  };
}
