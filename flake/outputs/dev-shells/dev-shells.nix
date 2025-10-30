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
            config.pre-commit.settings.package
            pkgs.just
          ]
          ++ config.pre-commit.settings.enabledPackages
          ++ (builtins.attrValues config.treefmt.build.programs);

          shellHook = config.pre-commit.installationScript;
        in
        {
          default = self'.devShells.stable;

          stable = pkgs.mkShell {
            packages = packages ++ [ self'.packages.stable ];
            inherit shellHook;
          };

          nightly = pkgs.mkShell {
            packages = packages ++ [ self'.packages.nightly ];
            inherit shellHook;
          };
        };
    };
}
