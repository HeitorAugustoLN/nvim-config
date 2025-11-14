alias b := build
alias bn := build-nightly
alias bs := build-stable
alias c := check
alias cl := clean
alias d := develop
alias dev := develop
alias dn := dev-nightly
alias ds := dev-stable
alias f := format
alias fmt := format
alias n := nightly
alias r := repl
alias s := stable
alias u := update
alias up := update

# List all available recipes.
default:
    @just --list

# Build a flake output.
[group("Build")]
build *args:
    nix build {{ args }}

# Enter a development shell.
[group("Develop")]
develop *args:
    nix develop {{ args }}

# Enter the nix repl in debug mode.
[group("Develop")]
repl:
    NIX_DEBUG_REPL=1 nix repl .

# Run the nightly neovim configuration.
[group("Run")]
nightly *args:
    nix run .#nightly -- {{ args }}

# Run the stable neovim configuration.
[group("Run")]
stable *args:
    nix run .#stable -- {{ args }}

# Build the nightly neovim configuration.
[group("Build")]
build-nightly:
    just build .#nightly

# Build the stable neovim configuration.
[group("Build")]
build-stable:
    just build .#stable

# Enter a nightly development shell.
[group("Develop")]
dev-nightly:
    just develop .#nightly

# Enter a stable development shell.
[group("Develop")]
dev-stable:
    just develop .#nightly

# Run flake checks.
[group("Code Quality")]
check *args:
    nix flake check {{ args }}

# Format the code.
[group("Code Quality")]
format:
    nix fmt

# Update flake inputs.
[group("Maintenance")]
update:
    nix flake update

# Clean the project.
[group("Maintenance")]
clean:
    rm -f result*
