# Dotfiles + Home-Manager Setup

> **Last updated:** January 12, 2026

## Overview

Marcel uses [home-manager](https://github.com/nix-community/home-manager) with Nix Flakes for declarative dotfiles management.

## Repository

- **URL:** https://github.com/mkoertgen/dotfiles
- **Local path (WSL):** `~/git/oss/mkoertgen/dotfiles`
- **Branch:** `master` (→ TODO: switch to `main`)

## Structure

```
dotfiles/
├── flake.nix          # Home-manager flake definition
├── flake.lock         # Pinned Nix dependencies
├── home.nix           # Main configuration
├── .gitconfig.work    # Work email (colenio.com)
├── .gitconfig.oss     # OSS email (gmail.com)
└── README.md
```

## home.nix Configuration

### Packages

- `gh` (GitHub CLI)
- `jq`, `yq-go` (JSON/YAML)
- `ripgrep`, `fd` (search)
- `bat`, `htop`, `tree`
- `direnv`, `nix-direnv`

### Programs

- **Git:** Aliases, conditional email via `includeIf`
- **Zsh:** Autosuggestion, syntax highlighting
- **Starship:** Custom prompt
- **Direnv:** Nix-direnv integration
- **Diff-so-fancy:** Git diff formatting

## Git Email Configuration

Directory-based email configuration using `includeIf`:

```
.gitconfig.work   → email = marcel.koertgen@colenio.com  (for ~/git/work/**)
.gitconfig.oss    → email = marcel.koertgen@gmail.com    (for ~/git/oss/**)
```

## Usage

```bash
# Update after changes
hms   # Alias for: home-manager switch --flake ~/git/oss/mkoertgen/dotfiles -b backup

# On a new machine
git clone git@github.com:mkoertgen/dotfiles.git ~/git/oss/mkoertgen/dotfiles
cd ~/git/oss/mkoertgen/dotfiles
nix run home-manager -- switch --flake . -b backup
```

## Git Directory Convention

```
~/git/
├── work/        → .gitconfig.work (colenio.com)
├── oss/         → .gitconfig.oss (gmail.com)
└── private/     → (not configured)
```

## TODOs

- [ ] Switch branch from `master` to `main`
- [ ] Clean up legacy files (.gitconfig, .zshrc, .bashrc) if unused
