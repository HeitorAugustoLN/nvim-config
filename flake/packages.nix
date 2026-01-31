{ inputs, self, ... }:
{
  perSystem =
    { system, ... }:
    {
      packages = builtins.mapAttrs (
        _: overlay:
        (import inputs.nixpkgs {
          overlays = [ overlay ];
          inherit system;
        }).nvim-heitor
      ) self.overlays;
    };
}
