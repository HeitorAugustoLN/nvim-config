{ inputs, ... }:
{
  flake.modules.nixvim.nightly =
    { pkgs, ... }:
    {
      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
    };
}
