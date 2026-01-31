alias c := check
alias cl := clean
alias n := nightly
alias r := repl
alias s := stable
alias u := update
alias ap := add-plugin
alias rp := remove-plugin
alias up := update-plugins
alias sp := show-plugins
alias fp := freeze-plugins
alias uf := unfreeze-plugins
alias vp := verify-plugins

# List all available recipes.
default:
    @just --list

# Run flake check and verify plugins
[group("Maintenance")]
check: (verify-plugins "start") (verify-plugins "opt")
    nix flake check

# Update flake and plugins
[group("Maintenance")]
update: (update-plugins "start") (update-plugins "opt")
    nix flake update

# Clean up build artifacts and temporary files.
[group("Maintenance")]
clean:
    rm -f result*

# Run the nightly neovim configuration.
[group("Run")]
nightly *args:
    nix run .#nightly -- {{ args }}

# Enter the nix repl in debug mode.
[group("Develop")]
repl:
    NIX_DEBUG_REPL=1 nix repl --expr "builtins.getFlake \"$PWD\""

# Run the stable neovim configuration.
[group("Run")]
stable *args:
    nix run .#stable -- {{ args }}

# Add a plugin (usage: add-plugin start|opt <npins args>).
[group("Plugins")]
add-plugin type *args:
    npins --lock-file {{ type }}-plugins.json add {{ args }}

# Remove a plugin (usage: remove-plugin start|opt [options] <name>).
[group("Plugins")]
remove-plugin type *args:
    npins --lock-file {{ type }}-plugins.json remove {{ args }}

# Update plugins (usage: update-plugins start|opt [options] [names]).
[group("Plugins")]
update-plugins type *args:
    npins --lock-file {{ type }}-plugins.json update {{ args }}

# Show plugins (usage: show-plugins start|opt [options]).
[group("Plugins")]
show-plugins type *args:
    npins --lock-file {{ type }}-plugins.json show {{ args }}

# Freeze plugins (usage: freeze-plugins start|opt [options] <names>).
[group("Plugins")]
freeze-plugins type *args:
    npins --lock-file {{ type }}-plugins.json freeze {{ args }}

# Unfreeze plugins (usage: unfreeze-plugins start|opt [options] <names>).
[group("Plugins")]
unfreeze-plugins type *args:
    npins --lock-file {{ type }}-plugins.json unfreeze {{ args }}

# Verify plugin hashes (usage: verify-plugins start|opt [options] [names]).
[group("Plugins")]
verify-plugins type *args:
    npins --lock-file {{ type }}-plugins.json verify {{ args }}
