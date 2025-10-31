{ config, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      files.files = [
        {
          path_ = ".github/workflows/check.yaml";

          drv = pkgs.writers.writeYAML "check.yaml" {
            name = "Flake check";
            run-name = "Flake check for \${{ github.ref_name }} by \${{ github.actor }}";

            on = {
              pull_request = null;
              push.branches = [ "main" ];
              workflow_dispatch = null;
            };

            jobs.check = {
              name = "Check flake on \${{ matrix.system }}";
              runs-on = "\${{ matrix.runner }}";

              strategy.matrix.include =
                let
                  systemToRunner =
                    system:
                    {
                      "aarch64-darwin" = "macos-14";
                      "aarch64-linux" = "ubuntu-24.04-arm";
                      "x86_64-darwin" = "macos-15-intel";
                      "x86_64-linux" = "ubuntu-latest";
                    }
                    .${system} or (throw "There is no runner for ${system}");
                in
                map (system: {
                  inherit system;
                  runner = systemToRunner system;
                }) config.systems;

              steps = [
                {
                  name = "Checkout repository";
                  uses = "actions/checkout@v5";
                }
                {
                  name = "Check flake inputs";
                  uses = "DeterminateSystems/flake-checker-action@v12";
                }
                {
                  name = "Set up Nix";
                  uses = "cachix/install-nix-action@v31";
                }
                {
                  name = "Run flake check";
                  run = "nix flake check --accept-flake-config";
                }
              ];
            };
          };
        }
      ];
    };
}
