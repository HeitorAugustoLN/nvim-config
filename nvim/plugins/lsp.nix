{
  lib,
  pkgs,
  self,
  system,
  ...
}:
let
  inherit (lib) getExe;
in
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    lazyLoad.settings = {
      before.__raw = ''
        function()
          require("lz.n").trigger_load("blink.cmp")
        end
      '';

      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
      ];
    };

    servers = {
      lua_ls = {
        enable = true;
        settings.completion.callSnippet = "Replace";
      };

      nixd = {
        enable = true;
        settings =
          let
            flake = ''(builtins.getFlake "${self}")'';
          in
          {
            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
            formatting.command = [ "${getExe pkgs.nixfmt-rfc-style}" ];
            options.nixvim.expr = "${flake}.packages.${system}.nvim.options";
          };
      };
    };
  };
}
