{
  perSystem =
    {
      config,
      pkgs,
      self',
      ...
    }:
    {
      devShells = builtins.mapAttrs (
        _: nvim:
        pkgs.mkShell {
          packages = [
            pkgs.just
            nvim
          ];

          shellHook = config.pre-commit.installationScript;
        }
      ) self'.packages;
    };
}
