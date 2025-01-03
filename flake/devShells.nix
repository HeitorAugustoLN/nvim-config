{
  perSystem =
    {
      config,
      pkgs,
      self',
      ...
    }:
    {
      devShells = {
        default = self'.devShells.nvim;
        nvim = pkgs.mkShell {
          shellHook = config.pre-commit.installationScript;

          strictDeps = true;
          nativeBuildInputs = [ self'.packages.nvim ];
        };
        nvim-nightly = pkgs.mkShell {
          shellHook = config.pre-commit.installationScript;

          strictDeps = true;
          nativeBuildInputs = [ self'.packages.nvim-nightly ];
        };
      };
    };
}
