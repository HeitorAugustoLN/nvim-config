{ lib, pkgs, ... }:
let
  inherit (lib) getExe;
in
{
  autoGroups.nvim-lint.clear = true;

  plugins.lint = {
    enable = true;

    lazyLoad.settings.event = [
      "BufNewFile"
      "BufReadPost"
      "BufWritePost"
    ];

    autoCmd = {
      desc = "Lint on read, write, and insert leave";
      event = [
        "BufReadPost"
        "BufWritePost"
        "InsertLeave"
      ];
      group = "nvim-lint";
    };

    linters = {
      deadnix.cmd = getExe pkgs.deadnix;
      statix.cmd = getExe pkgs.statix;
      ruff.cmd = getExe pkgs.ruff;
    };

    lintersByFt = {
      nix = [
        "deadnix"
        "statix"
      ];

      python = [ "ruff" ];
    };
  };
}
