# Dotfiles

Declarative dotfiles management using [home-manager](https://github.com/nix-community/home-manager) with Nix Flakes.

## Quick Start

```bash
# Clone
git clone git@github.com:mkoertgen/dotfiles.git ~/git/oss/mkoertgen/dotfiles
cd ~/git/oss/mkoertgen/dotfiles

# Apply configuration
nix run home-manager -- switch --flake . -b backup

# After initial setup, use the alias:
hms
```

## What's Included

### Packages

- `gh` (GitHub CLI)
- `jq`, `yq-go` (JSON/YAML processing)
- `ripgrep`, `fd` (fast search)
- `bat`, `htop`, `tree`
- `direnv`, `nix-direnv`

### Programs

- **Git** - Aliases, directory-based email config via `includeIf`
- **Zsh** - Autosuggestions, syntax highlighting
- **Starship** - Custom prompt
- **Direnv** - Automatic nix-shell activation

## Git Email Configuration

Uses `includeIf` for directory-based email:

| Directory | Email |
|-----------|-------|
| `~/git/work/**` | marcel.koertgen@colenio.com |
| `~/git/oss/**` | marcel.koertgen@gmail.com |

## Files

| File | Purpose |
|------|---------|
| `flake.nix` | Flake definition with home-manager |
| `home.nix` | Main configuration |
| `.gitconfig.work` | Work email config |
| `.gitconfig.oss` | OSS email config |

## Aliases

```bash
hms   # home-manager switch --flake ~/git/oss/mkoertgen/dotfiles -b backup
```
