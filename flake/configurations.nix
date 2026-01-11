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
    {
      inputs',
      self',
      system,
      ...
    }:
    {
      nixvimConfigurations =
        let
          modules =
            let
              core = with self.modules.nixvim; [
                # keep-sorted start
                autoCommands
                builtConfig
                clipboard
                diagnostic
                env
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

              filetypes = with self.modules.nixvim; [
                # keep-sorted start
                git
                godot
                just
                lua
                markdown
                nix
                python
                query
                shell
                toml
                typst
                vim
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
                blink-cmp
                conform
                fzf-lua
                gitsigns
                lint
                lspconfig
                lz-n
                mini-ai
                mini-clue
                mini-cmdline
                mini-icons
                mini-statusline
                mini-surround
                oil
                showkeys
                treesitter
                # keep-sorted end
              ];
            in
            lib.flatten [
              # keep-sorted start
              colorschemes
              core
              filetypes
              performance
              plugins
              # keep-sorted end
            ];
        in
        {
          default = self'.nixvimConfigurations.nightly;
        }
        //
          builtins.mapAttrs
            (
              _: modules:
              inputs.nixvim.lib.evalNixvim {
                inherit modules system;
                extraSpecialArgs = { inherit inputs' self'; };
              }
            )
            {
              nightly = modules ++ [ self.modules.nixvim.nightly ];
              stable = modules;
            };
    };
}
