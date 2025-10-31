{
  perSystem =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      files.files = [
        {
          path_ = ".gitignore";
          drv = pkgs.writeText ".gitignore" (
            builtins.concatStringsSep "\n" (
              [
                ".direnv/"
                "result*"
              ]
              ++ lib.optionals config.pre-commit.settings.install.enable [ ".pre-commit-config.yaml" ]
            )
          );
        }
      ];
    };
}
