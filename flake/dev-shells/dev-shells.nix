{ inputs, ... }:
{
  perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        overlays = [ inputs.gen-luarc.overlays.default ];
        inherit system;
      };

      devShells = builtins.mapAttrs (
        _: nixvim:
        pkgs.mkShell {
          packages = [
            nixvim.config.build.package
            pkgs.just
          ];

          shellHook = ''
            ${config.pre-commit.installationScript}
            ln -fs ${
              let
                args = pkgs.mk-luarc {
                  lua-version = "jit51";
                  nvim = nixvim.config.package;
                  plugins = nixvim.config.extraPlugins;
                };

                luarcWithGlobals = args // {
                  diagnostics = args.diagnostics or { } // {
                    globals = [
                      "client"
                      "bufnr"
                    ];
                  };
                };
              in
              pkgs.luarc-to-json luarcWithGlobals
            } .luarc.json
          '';
        }
      ) config.nixvimConfigurations;
    };
}
