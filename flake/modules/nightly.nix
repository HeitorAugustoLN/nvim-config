{
  flake.modules.nixvim.nightly =
    { inputs', ... }:
    {
      package = inputs'.neovim-nightly-overlay.packages.neovim;
    };
}
