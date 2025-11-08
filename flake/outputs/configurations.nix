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
              languages = with self.modules.nixvim; [
                godot
                lua
                nix
              ];

              plugins = with self.modules.nixvim; [
                blink-cmp
                conform
                dap
                lint
                lspconfig
                lz-n
                mini-ai
                mini-icons
                mini-surround
                oil
                otter
                showkeys
                treesitter
                vague
              ];
            in
            with self.modules.nixvim;
            [
              byteCompileLua
              combinePlugins
              clipboard
              diagnostics
              highlightYank
              leader
              lineNumberToggle
              luaLoader
              options
            ]
            ++ languages
            ++ plugins;
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
