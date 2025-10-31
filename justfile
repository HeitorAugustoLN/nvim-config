check *args:
    nix flake check {{ args }}

generate:
    nix run .#write-files --builders ""
    nix run .#write-flake --builders ""

update *args:
    nix flake update {{ args }}
