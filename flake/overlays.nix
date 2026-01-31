{
  config,
  inputs,
  lib,
  self,
  ...
}:
{
  flake.overlays = {
    default = self.overlays.nightly;

    stable =
      final: prev:
      let
        appName = "nvim-heitor";
      in
      {
        ${appName} = prev.callPackage (
          {
            dev ? false,

            pkgs,
            lib,
            stdenv,
            neovim-unwrapped,

            curl,
            ripgrep,
            wayland,
            wl-clipboard,

            nixfmt,
            stylua,
            taplo,

            lua-language-server,
            nixd,

            fzf,

            vimPlugins,
          }:
          let
            args =
              let
                initLua = ../nvim/init.lua;
              in
              {
                inherit appName;

                extraBinPath =
                  let
                    externalTools = {
                      inherit curl ripgrep;
                    }
                    // lib.optionalAttrs (lib.meta.availableOn stdenv.hostPlatform wayland) { inherit wl-clipboard; };

                    formatters = {
                      lua = stylua;
                      nix = nixfmt;
                      toml = taplo;
                    };

                    languageServers = {
                      lua = lua-language-server;
                      nix = nixd;
                      toml = taplo;
                    };

                    pluginDependencies.fzf-lua = fzf;
                  in
                  [
                    formatters
                    languageServers
                    pluginDependencies
                    externalTools
                  ]
                  |> builtins.concatMap builtins.attrValues
                  |> lib.flatten
                  |> lib.unique;

                extraBuilderArgs.passthru = {
                  inherit (args) plugins;
                  unwrapped = neovim-unwrapped;
                };

                initLua = builtins.readFile initLua;

                plugins =
                  let
                    npinsToPlugins = input: config.nexus.lib.npinsToPlugins { inherit input pkgs; };
                  in
                  {
                    dev.config = {
                      impure = "~/nvim-config/nvim";

                      pure = lib.fileset.toSource {
                        root = ../nvim;

                        fileset = lib.fileset.unions [
                          ../nvim/after
                          ../nvim/lua
                          initLua
                        ];
                      };
                    };

                    optAttrs = npinsToPlugins ../opt-plugins.json // {
                      "blink.cmp" = vimPlugins.blink-cmp;
                    };

                    start =
                      let
                        git = [
                          "git_config"
                          "git_rebase"
                          "gitattributes"
                          "gitcommit"
                          "gitignore"
                        ];

                        godot = [
                          "gdscript"
                          "gdshader"
                          "godot_resource"
                        ];

                        lua = [
                          "lua"
                          "luadoc"
                          "luap"
                        ];

                        vim = [
                          "vim"
                          "vimdoc"
                        ];
                      in
                      [
                        "bash"
                        "comment"
                        "diff"
                        git
                        godot
                        "json"
                        "just"
                        lua
                        "markdown"
                        "nix"
                        "query"
                        "regex"
                        "toml"
                        vim
                        "yaml"
                        "zsh"
                      ]
                      |> lib.flatten
                      |> builtins.concatMap (language: [
                        vimPlugins.nvim-treesitter.parsers.${language}
                        vimPlugins.nvim-treesitter.queries.${language}
                      ]);

                    startAttrs = npinsToPlugins ../start-plugins.json // {
                      inherit (vimPlugins) nvim-treesitter;
                    };
                  };

                providers = {
                  nodeJs.enable = false;
                  perl.enable = false;
                  python3.enable = false;
                  ruby.enable = false;
                };

                wrapperArgs = [
                  "--set"
                  "NEOVIM_CONFIG"
                  (if dev then args.plugins.dev.config.impure else args.plugins.dev.config.pure.outPath)
                ];
              };
          in
          inputs.mnw.lib.wrap pkgs args
        ) { };
      };

    nightly = lib.composeManyExtensions [
      inputs.neovim-nightly-overlay.overlays.default
      self.overlays.stable
    ];
  };
}
