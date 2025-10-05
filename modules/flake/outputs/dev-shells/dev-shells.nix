{
  perSystem =
    {
      config,
      inputs',
      pkgs,
      self',
      ...
    }:
    {
      devShells =
        let
          packages = [
            pkgs.npins
            config.pre-commit.settings.package
          ]
          ++ config.pre-commit.settings.enabledPackages
          ++ (builtins.attrValues config.treefmt.build.programs);
        in
        {
          default = self'.devShells.stable;

          stable = pkgs.mkShell {
            packages = packages ++ [ self'.packages.stable.devMode ];
            shellHook = config.pre-commit.installationScript + ''
              ln -fs ${
                pkgs.mk-luarc-json {
                  lua-version = "jit51";
                  plugins = config.nexus.optPlugins ++ config.nexus.startPlugins;
                }
              } .luarc.json
            '';
          };

          nightly = pkgs.mkShell {
            packages = packages ++ [ self'.packages.nightly.devMode ];
            shellHook = config.pre-commit.installationScript + ''
              ln -fs ${
                pkgs.mk-luarc-json {
                  lua-version = "jit51";
                  nvim = inputs'.neovim-nightly-overlay.packages.neovim;
                  plugins = config.nexus.optPlugins ++ config.nexus.startPlugins;
                }
              } .luarc.json
            '';
          };
        };
    };
}
