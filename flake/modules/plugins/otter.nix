{
  flake.modules.nixvim.otter = {
    plugins.otter = {
      enable = true;
      # autoActivate is true by default, which is what we want.
      # Not specifying lazy-loading means it will load at startup.
    };
  };
}
