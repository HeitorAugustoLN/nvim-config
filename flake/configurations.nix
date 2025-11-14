{ inputs, self, ... }:
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
                autoCommands
                clipboard
                diagnostics
                keymaps
                luaLoader
                lsp
                options
              ];

              colorschemes = [ self.modules.nixvim.catppuccin ];

              languages = with self.modules.nixvim; [
                godot
                just
                lua
                markdown
                nix
                yaml
              ];

              performance = with self.modules.nixvim; [
                byteCompileLua
                combinePlugins
              ];

              plugins = with self.modules.nixvim; [
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
                mini-icons
                mini-statusline
                mini-surround
                oil
                showkeys
                treesitter
                which-key
              ];
            in
            colorschemes ++ core ++ languages ++ performance ++ plugins;
        in
        {
          default = self'.nixvimConfigurations.stable;

          nightly = inputs.nixvim.lib.evalNixvim {
            modules = modules ++ [ self.modules.nixvim.nightly ];
            inherit system;
          };

          stable = inputs.nixvim.lib.evalNixvim { inherit modules system; };
        };
    };
}
