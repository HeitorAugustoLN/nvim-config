{ lib, ... }:
{
  perSystem =
    { pkgs, self', ... }:
    {
      devShells = builtins.mapAttrs (
        _: neovim:
        pkgs.mkShell {
          packages = [
            (neovim.override { dev = true; }).devMode
            pkgs.npins
            pkgs.just
          ];

          shellHook = ''
            ln -fs ${
              pkgs.writers.writeJSON "luarc.json" {
                "$schema" =
                  "https://raw.githubusercontent.com/LuaLS/vscode-lua/refs/heads/master/setting/schema.json";

                runtime.version = "LuaJIT";

                workspace = {
                  library =
                    let
                      luvit-meta = pkgs.fetchFromGitHub {
                        name = "luvit-meta";
                        owner = "Bilal2453";
                        repo = "luvit-meta";
                        rev = "0ea4ff636c5bb559ffa78108561d0976f4de9682";
                        hash = "sha256-k4QzhL5pUFwX9H3p7voZ5FD6wOaUQHg75xBuHwWxal4=";
                      };
                    in
                    [
                      neovim.plugins.dev.config.impure
                      "${neovim.unwrapped}/share/nvim/runtime/lua"
                      "\${3rd}/busted/library"
                      "\${3rd}/luassert/library"
                      "${luvit-meta}/library"
                    ]
                    ++ (
                      builtins.attrValues neovim.plugins.startAttrs ++ builtins.attrValues neovim.plugins.optAttrs
                      |> map (
                        plugin:
                        if plugin.vimPlugin or false then
                          [ "${plugin}/lua" ]
                        else
                          [
                            "${plugin}/lib/lua/5.1"
                            "${plugin}/share/lua/5.1"
                          ]
                      )
                      |> lib.flatten
                    );
                };
              }
            } .luarc.json
          '';
        }
      ) self'.packages;
    };
}
