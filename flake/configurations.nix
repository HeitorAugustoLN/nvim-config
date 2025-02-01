{ inputs, lib, ... }:
{
  imports = [ inputs.nixvim.flakeModules.default ];

  nixvim = {
    checks.enable = true;
    packages.enable = true;
  };

  perSystem =
    {
      inputs',
      self',
      system,
      ...
    }:
    let
      extraSpecialArgs = {
        inherit (inputs) self;
        inherit
          inputs
          inputs'
          self'
          system
          ;
      };
    in
    {
      nixvimConfigurations = {
        default = self'.nixvimConfigurations.nvim;
        nvim = inputs.nixvim.lib.evalNixvim {
          inherit extraSpecialArgs system;
          modules = [ ../nvim ];
        };
        nvim-nightly = inputs.nixvim.lib.evalNixvim {
          inherit extraSpecialArgs system;
          modules = [
            ../nvim
            { package = lib.mkForce inputs'.neovim-nightly.packages.neovim; }
          ];
        };
      };
    };
}
