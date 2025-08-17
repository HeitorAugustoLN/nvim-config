{ inputs, ... }:
{
  perSystem =
    {
      self',
      inputs',
      pkgs,
      ...
    }:
    {
      packages =
        let
          commonArgs = {
            appName = "nvim-heitor";

            extraBinPath = with pkgs; [
              lua-language-server
              nixd
            ];

            initLua = builtins.readFile ../../init.lua;

            plugins = {
              dev.config = {
                pure = ../../.;
                impure = "~/Projects/nvim-config";
              };

              start = inputs.mnw.lib.npinsToPlugins pkgs ../../start.json;
              opt =
                with pkgs.vimPlugins;
                [
                  blink-cmp
                  nvim-treesitter.withAllGrammars
                ]
                ++ inputs.mnw.lib.npinsToPlugins pkgs ../../opt.json;
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

          nightly-dev = self'.packages.nightly.devMode;
          stable = inputs.mnw.lib.wrap { inherit pkgs; } commonArgs;
          stable-dev = self'.packages.stable.devMode;
        };
    };
}
