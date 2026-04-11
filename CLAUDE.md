# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A dotfiles/configuration repository managed with **GNU Stow**. Each top-level directory is a stow package containing config files for a specific tool, using the `dot-` prefix convention (stow's `--dotfiles` flag translates `dot-` to `.`).

## Stow Commands

```bash
# Deploy a package (symlinks dot-config/* into ~/.config/*)
stow --dotfiles <package>        # e.g. stow --dotfiles nvim

# Adopt live config into repo (pulls real files in, replaces with symlinks)
stow --dotfiles <package> --adopt

# Update brew package list
brew list > brew_list.txt
```

## Package Layout

Each package follows the pattern: `<package>/dot-config/<tool>/...` which stow maps to `~/.config/<tool>/...`. Exception: `dotfiles/` contains shell configs (`dot-zshrc`, `dot-zshenv`, `dot-zprofile`, `dot-fzf-git.sh`, `dot-tmux-commands`) that map to `~/.*`.

| Package | What it configures |
|---|---|
| `aerospace` | AeroSpace tiling window manager (macOS) |
| `bat` | bat (cat replacement) - theme: tokyonight_night |
| `btop` | btop system monitor |
| `dotfiles` | zsh config, fzf-git integration, tmux-commands |
| `fastfetch` | fastfetch system info |
| `ghostty` | Ghostty terminal emulator |
| `nvim` | Neovim (LazyVim-based config) |
| `svim` | Minimal neovim config (`NVIM_APPNAME=svim`) |
| `tmux` | tmux config + TPM plugins |
| `tmuxinator` | tmuxinator session layouts |

## Key Details

- **Neovim** uses LazyVim as its base distribution. Plugin configs live in `nvim/dot-config/nvim/lua/plugins/`. Uses vim-tmux-navigator for seamless pane switching with tmux.
- **tmux** prefix is `C-Space`. Plugins managed by TPM. The `tmux/.config/` directory contains the currently deployed (stowed) version; `tmux/dot-config/` is the stow source.
- **Two neovim configs exist**: `nvim` (full LazyVim) and `svim` (minimal, used for scratch notes and quick config edits via tmux popups).
- **Shell aliases** remap common tools: `ls`=eza, `cd`=zoxide, `grep`=rg, `cat`=bat, `vim`/`v`=nvim.
- **tmuxinator sessions**: `working`, `configuration`, `dev`, `experimental`, `web` - defined in `tmuxinator/dot-config/tmuxinator/`.

## Dual Directory Issue

`tmux/` and `bat/` each have both `.config/` and `dot-config/` subdirectories. The `dot-config/` version is the stow source of truth; `.config/` may be stale or from a prior layout.
