{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells = builtins.mapAttrs (
        _: nixvim:
        pkgs.mkShell {
          packages = [
            nixvim.config.build.package
            pkgs.just
          ];

          env.NIXVIM_INIT_SOURCE = nixvim.config.build.initSource;
        }
      ) config.nixvimConfigurations;
    };
}
