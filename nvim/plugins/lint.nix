{ lib, pkgs, ... }:
{
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
      deadnix = {
        cmd = lib.getExe pkgs.deadnix;
      };
      statix = {
        cmd = lib.getExe pkgs.statix;
      };
      ruff = {
        cmd = lib.getExe pkgs.ruff;
      };
    };

    lintersByFt = {
      nix = [
        "deadnix"
        "statix"
      ];
      python = [ "ruff" ];
    };
  };

  autoGroups = {
    nvim-lint = {
      clear = true;
    };
  };
}
