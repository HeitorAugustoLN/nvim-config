{
  flake.modules.nixvim.lint = {
    autoGroups.lint.clear = true;

    plugins.lint = {
      enable = true;

      lazyLoad.settings.event = [
        "BufNewFile"
        "BufReadPost"
        "BufWritePost"
        "InsertLeave"
      ];

      autoCmd = {
        desc = "Lint on read, write, and insert leave";

        event = [
          "BufReadPost"
          "BufWritePost"
          "InsertLeave"
        ];

        group = "lint";
      };
    };
  };
}
