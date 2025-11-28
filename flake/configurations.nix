{
  inputs,
  lib,
  self,
  ...
}:
{
  imports = [ inputs.nixvim.flakeModules.default ];

  nixvim = {
    checks.enable = true;
    packages.enable = true;
  };

  perSystem =
    { self', system, ... }:
    {
      nixvimConfigurations =
        let
          modules =
            let
              core = with self.modules.nixvim; [
                # keep-sorted start
                autoCommands
                clipboard
                diagnostic
                keymaps
                lsp
                luaLoader
                options
                providers
                ripgrep
                # keep-sorted end
              ];

              colorschemes = [
                # keep-sorted start
                self.modules.nixvim.catppuccin
                # keep-sorted end
              ];

              languages = with self.modules.nixvim; [
                # keep-sorted start
                godot
                just
                lua
                markdown
                nix
                python
                shell
                toml
                typst
                yaml
                # keep-sorted end
              ];

              performance = with self.modules.nixvim; [
                # keep-sorted start
                byteCompileLua
                combinePlugins
                # keep-sorted end
              ];

              plugins = with self.modules.nixvim; [
                # keep-sorted start
                autopairs
                blink-cmp
                blink-indent
                conform
                fzf-lua
                gitsigns
                lint
                lspconfig
                luasnip
                lz-n
                mini-ai
                mini-clue
                mini-icons
                mini-move
                mini-statusline
                mini-surround
                oil
                showkeys
                spider
                statuscol
                treesitter
                # keep-sorted end
              ];
            in
            lib.flatten [
              # keep-sorted start
              colorschemes
              core
              languages
              performance
              plugins
              # keep-sorted end
            ];
        in
        {
          default = self'.nixvimConfigurations.nightly;
        }
        // builtins.mapAttrs (_: modules: inputs.nixvim.lib.evalNixvim { inherit modules system; }) {
          nightly = modules ++ [ self.modules.nixvim.nightly ];
          stable = modules;
        };
    };
}
