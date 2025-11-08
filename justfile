default:
    @just --list

# Build the neovim configuration
build *args:
    @nix build {{ args }}

# Enter the development shell
dev *args:
    @nix develop {{ args }}

# Run checks
check *args:
    @nix flake check {{ args }}

# Format the code
fmt:
    @nix fmt

# Update flake inputs
update:
    @nix flake update

# Clean the project
clean:
    @rm -rf result*
