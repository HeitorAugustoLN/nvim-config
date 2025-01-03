{ inputs, ... }:
{
  perSystem =
    {
      inputs',
      self',
      system,
      ...
    }:
    let
      nixvim = inputs.nixvim.legacyPackages.${system};
      nixvimLib = inputs.nixvim.lib.${system};
      nixvimModule = {
        module = import ../nvim;
        extraSpecialArgs = {
          inherit inputs inputs' system;
        };
      };
    in
    {
      checks = {
        default = self'.checks.nvim;
        nvim = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
      };

      packages = {
        default = self'.packages.nvim;
        nvim = nixvim.makeNixvimWithModule nixvimModule;
        nvim-nightly = self'.packages.nvim.extend {
          package = inputs'.neovim-nightly.packages.neovim;
        };
      };
    };
}
