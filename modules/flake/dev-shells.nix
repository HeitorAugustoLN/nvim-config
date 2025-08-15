{
  perSystem =
    {
      config,
      pkgs,
      self',
      ...
    }:
    {
      devShells =
        let
          packages = [
            self'.packages.write-flake
            pkgs.npins
          ];
        in
        {
          default = self'.devShells.stable;

          stable = pkgs.mkShell {
            packages = packages ++ [ self'.packages.stable-dev ];
            shellHook = config.pre-commit.installationScript;
          };

          nightly = pkgs.mkShell {
            packages = packages ++ [ self'.packages.nightly-dev ];
            shellHook = config.pre-commit.installationScript;
          };
        };
    };
}
