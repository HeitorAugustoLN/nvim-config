{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:
{
  plugins.lsp = {
    enable = true;

    servers = {
      lua_ls = {
        enable = true;
        settings = {
          completion = {
            callSnippet = "Replace";
          };
        };
      };

      nixd = {
        enable = true;
        settings =
          let
            flake = ''(builtins.getFlake "${inputs.self}")'';
          in
          {
            nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
            };
            options.nixvim.expr = "${flake}.packages.${system}.nvim.options";
          };
      };
    };
  };
}
