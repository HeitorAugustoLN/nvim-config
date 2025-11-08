# List all available recipes.
default:
    @just --list

# Build a flake output.
build *args:
    @nix build {{ args }}

# Enter a development shell.
dev *args:
    @nix develop {{ args }}

# Run flake checks.
check *args:
    @nix flake check {{ args }}

# Format the code.
fmt:
    @nix fmt

# Update flake inputs.
update:
    @nix flake update

# Clean the project.
clean:
    @rm -f result*
