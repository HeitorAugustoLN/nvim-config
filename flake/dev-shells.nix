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
        default = self'.devShells.neovim;

        neovim = pkgs.mkShell {
          shellHook = config.pre-commit.installationScript;

          strictDeps = true;
          nativeBuildInputs = [ self'.packages.neovim ];
        };

        neovim-nightly = pkgs.mkShell {
          shellHook = config.pre-commit.installationScript;

          strictDeps = true;
          nativeBuildInputs = [ self'.packages.neovim-nightly ];
        };
      };
    };
}
