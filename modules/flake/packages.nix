{ inputs, lib, ... }:
{
  perSystem =
    {
      config,
      self',
      inputs',
      pkgs,
      ...
    }:
    {
      nexus = {
        startPlugins = inputs.mnw.lib.npinsToPlugins pkgs ../../start.json;
        optPlugins = [
          pkgs.vimPlugins.blink-cmp
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        ]
        ++ inputs.mnw.lib.npinsToPlugins pkgs ../../opt.json;
      };

      packages =
        let
          commonArgs = {
            appName = "nvim-heitor";

            extraBinPath =
              let
                formatters = [
                  pkgs.nixfmt
                  pkgs.stylua
                ];

                languageServers = [
                  pkgs.lua-language-server
                  pkgs.nixd
                ];

                neovimDependencies = [
                  pkgs.ripgrep
                ]
                ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [ pkgs.wl-clipboard ];

                pluginDependencies = {
                  snacks = [
                    pkgs.fd
                    pkgs.ripgrep
                  ];
                };
              in
              formatters
              ++ languageServers
              ++ neovimDependencies
              ++ (pluginDependencies |> builtins.attrValues |> lib.flatten)
              |> lib.unique;

            initLua = builtins.readFile ../../init.lua;

            plugins = {
              dev.config = {
                pure = lib.fileset.toSource {
                  root = ../../.;
                  fileset = lib.fileset.unions [
                    ../../lua
                    ../../init.lua
                  ];
                };

                impure = "~/Projects/nvim-config";
              };

              start = config.nexus.startPlugins;
              opt = config.nexus.optPlugins;
            };

            providers = {
              nodeJs.enable = false;
              perl.enable = false;
              python3.enable = false;
              ruby.enable = false;
            };
          };
        in
        {
          default = self'.packages.stable;

          nightly = inputs.mnw.lib.wrap { inherit pkgs; } (
            commonArgs // { inherit (inputs'.neovim-nightly-overlay.packages) neovim; }
          );
          stable = inputs.mnw.lib.wrap { inherit pkgs; } commonArgs;
        };
    };
}
