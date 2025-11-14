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
            nvim
            pkgs.just
          ];

          shellHook = config.pre-commit.installationScript;
        }
      ) self'.packages;
    };
}
