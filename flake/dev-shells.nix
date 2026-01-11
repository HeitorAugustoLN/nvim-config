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

          inherit (nixvim.config) env;
        }
      ) config.nixvimConfigurations;
    };
}
