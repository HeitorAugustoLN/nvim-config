{
  inputs,
  lib,
  pkgs,
  ...
}:
let
  nvim-lint = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-lint";
    src = inputs.nvim-lint;
    version = inputs.nvim-lint.lastModifiedDate;
  };
in
{
  plugins.lint = {
    enable = true;
    package = nvim-lint;
    lazyLoad.settings = {
      event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
      ];
    };

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
    };

    linters_by_ft = {
      nix = [
        "deadnix"
        "statix"
      ];
    };
  };

  autoGroups = {
    nvim-lint = {
      clear = true;
    };
  };
}
