{
  config,
  inputs,
  lib,
  ...
}:
{

  perSystem =
    {
      inputs',
      pkgs,
      self',
      ...
    }:
    let
      args =
        let
          initLua = ../nvim/init.lua;
        in
        {
          appName = "nvim-heitor";

          extraBinPath =
            let
              formatters = {
                lua = pkgs.stylua;
                nix = pkgs.nixfmt;
              };

              languageServers = {
                lua = pkgs.lua-language-server;
                nix = pkgs.nixd;
              };

              pluginDependencies = { };

              externalTools = {
                inherit (pkgs) curl ripgrep;
              }
              // lib.optionalAttrs (lib.meta.availableOn pkgs.stdenv.hostPlatform pkgs.wayland) {
                inherit (pkgs) wl-clipboard;
              };
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
            unwrapped = args.neovim;
          };

          initLua = builtins.readFile initLua;
          neovim = pkgs.neovim-unwrapped;

          plugins =
            let
              npinsToPlugins = input: config.nexus.lib.npinsToPlugins { inherit input pkgs; };
            in
            {
              dev.config = {
                impure = "~/Projects/nvim-config/nvim";

                pure = lib.fileset.toSource {
                  root = ../nvim;

                  fileset = lib.fileset.unions [
                    ../nvim/lua
                    initLua
                  ];
                };
              };

              optAttrs = npinsToPlugins ../opt-plugins.json;

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
                  "diff"
                  git
                  godot
                  "json"
                  "just"
                  lua
                  "markdown"
                  "nix"
                  "python"
                  "query"
                  "regex"
                  "toml"
                  vim
                  "yaml"
                  "zsh"
                ]
                |> lib.flatten
                |> builtins.concatMap (language: [
                  pkgs.vimPlugins.nvim-treesitter.parsers.${language}
                  pkgs.vimPlugins.nvim-treesitter.queries.${language}
                ]);

              startAttrs = npinsToPlugins ../start-plugins.json // {
                inherit (pkgs.vimPlugins) nvim-treesitter;
              };
            };

          providers = {
            nodeJs.enable = false;
            perl.enable = false;
            python3.enable = false;
            ruby.enable = false;
          };
        };

      nightlyArgs =
        let
          inherit (inputs'.neovim-nightly-overlay.packages) neovim;
        in
        lib.recursiveUpdate args {
          extraBuilderArgs.passthru.unwrapped = neovim;
          inherit neovim;
        };
    in
    {
      packages = {
        default = self'.packages.nightly;
        nightly = inputs.mnw.lib.wrap pkgs nightlyArgs;
        stable = inputs.mnw.lib.wrap pkgs args;
      };
    };
}
