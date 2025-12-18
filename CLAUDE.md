# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managing configuration files for a minimal, developer-focused environment. The repository uses a standard dotfiles structure where each top-level directory contains configuration files that mirror the home directory layout (e.g., `neovim/.config/nvim`).

## Active Tools

The repository currently manages configurations for:
- **neovim** - Primary text editor with LSP and language support (LazyVim-based)
- **tmux** - Terminal multiplexer with session persistence
- **wezterm** - Terminal emulator
- **zsh** - Shell with Oh My Zsh
- **hypr** - Hyprland window manager (Wayland) with hypridle and hyprlock
- **rofi** - Application launcher/menu
- **wallpapers** - Desktop wallpapers (10+ high-res 5120x1440 images)

## Theme

**Kanagawa Dragon** is the primary unified theme across all tools:
- **Neovim** - Kanagawa Dragon
- **Tmux** - Kanagawa Dragon (via tmux-kanagawa plugin)
- **Wezterm** - Kanagawa Dragon (Gogh)
- **Hyprland borders** - Custom gradient (muted pumpkin #cc7722 → golden yellow #e6b84a)
- **Hyprlock** - Catppuccin Mocha (modified mauve #bb9af7)
- **Rofi** - Catppuccin Mocha with transparency

**Fonts:**
- JetBrainsMono Nerd Font (primary: Wezterm, Hyprlock, Hyprland)
- Inter font (Rofi)
- Ubuntu Nerd Font (Rofi icons)

## Neovim Configuration

### Architecture
**LazyVim-based configuration** with custom overrides:
- **Entry point**: `neovim/.config/nvim/init.lua` (minimal, loads LazyVim)
- **Core config**: `neovim/.config/nvim/lua/config/` (lazy.lua, options.lua, keymaps.lua, autocmds.lua)
- **Plugin overrides**: `neovim/.config/nvim/lua/plugins/` (colorscheme.lua, dashboard.lua)
- **Theme customization**: `neovim/.config/nvim/after/plugin/theme.lua` (transparency for NvimTree)
- **Plugin manager**: Lazy.nvim (auto-bootstraps on first run)
- **Plugin lockfile**: `lazy-lock.json` (pin plugin versions)

### LSP Setup
Uses **nvim-lspconfig** via LazyVim defaults with **Mason** for automatic LSP server installation. Language servers are managed through Mason, not manually installed. Configured for:
- Lua (with vim globals)
- Python
- TypeScript/JavaScript
- JSON
- Go

### Key Plugins (from LazyVim)
- **Theme**: Kanagawa Dragon
- **Completion**: blink.cmp (sources: LSP, buffer, path) + LuaSnip
- **File navigation**: Telescope.nvim (with fzf-native)
- **Syntax**: nvim-treesitter
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **LSP**: nvim-lspconfig + Mason + Mason-lspconfig
- **Diagnostics**: Trouble.nvim
- **UI**: lualine, noice.nvim, nvim-web-devicons
- **Git**: gitsigns.nvim
- **Motion**: flash.nvim

### Plugin Management
- Update plugins: `:Lazy sync`
- Update LSP servers: `:Mason`
- Check health: `:checkhealth`

## Tmux Configuration

### Key Features
- **Prefix**: `Ctrl-a` (not default Ctrl-b)
- **Vi mode**: Enabled in copy mode
- **Mouse support**: Enabled
- **Plugin path**: `$HOME/.dotfiles/tmux/.tmux/plugins`

### Plugins (TPM)
- `tmux-plugins/tmux-resurrect` - Session persistence
- `Nybkox/tmux-kanagawa` - Theme (dragon variant)

Theme configuration:
- `@kanagawa-theme 'dragon'` - Dark variant
- `@kanagawa-ignore-window-colors true` - Preserve terminal colors

### Installing/Updating Plugins
Press `Ctrl-a` + `I` (uppercase i) inside tmux

### Custom Keybindings
- `Ctrl-a` + `r` - Reload config
- `Ctrl-a` + `|` - Split horizontally
- `Ctrl-a` + `-` - Split vertically
- `Ctrl-a` + `h/j/k/l` - Vim-style pane navigation
- `y` in copy mode - Copy to system clipboard (macOS: pbcopy, Linux: wl-copy/xclip)

### Status Bar
Kanagawa Dragon theme with standard tmux status information

## Shell Configuration (Zsh)

### Setup
- **Framework**: Oh My Zsh
- **Theme**: robbyrussell
- **Plugins**: git
- **Editor**: Neovim (both VISUAL and EDITOR)

### Environment Variables
- **ROCm/HIP**: GPU compute paths for AMD GPUs (`/opt/rocm`, GFX version 11.0.0)
- **Cargo**: Rust bin path (`~/.cargo/bin`)
- **Go**: Go bin path (`~/go/bin`)
- **Local bin**: `~/.local/bin/env` sourced

### Aliases
- `zshconf` - Edit ~/.zshrc
- `hyprconf` - Edit Hyprland config
- `nvimconf` - Edit Neovim init.lua
- `dotfiles` - Open dotfiles in Neovim

### Additional Paths
- **Ollama models**: `~/.ollama/models` (custom location)

## Rofi Configuration

Application launcher with custom styling:
- **Config**: `rofi/.config/rofi/config.rasi`
- **Theme**: Kanagawa Dragon colors (no transparency)
- **Window**: 800x550px, 1.75px border, 12px radius, opaque background
- **Fonts**: Inter Medium (text), Ubuntu Nerd Font (icons)
- **Colors**:
  - Background: #181616 (dragonBlack3)
  - Text: #c5c9c5 (dragonWhite)
  - Selected: #435965 (dragonBlue5)
  - Hover: #1D1C19 (dragonBlack2)
  - Border: #625e5a (dragonBlack6)
- **Features**:
  - Clean input bar with bottom border
  - 7 visible list items with icons
  - Footer with keyboard shortcuts (H/J/K/L vim navigation hints)
  - Launcher shows: application icon + name
- **Launch**: `rofi -show drun -theme ~/.config/rofi/config.rasi` or `Super+Space` in Hyprland

## Wezterm Configuration

Minimal terminal emulator setup:
- **Font**: JetBrainsMono Nerd Font Mono (size 12, line height 1.25)
- **Font features**: Ligatures disabled (calt=0, clig=0, liga=0)
- **Theme**: Kanagawa Dragon (Gogh)
- **Window decorations**: TITLE | RESIZE
- **macOS blur**: 10px
- **Tab bar**: Disabled
- **Padding**: 8px all sides

## Hyprland Configuration

### Display
- **Monitor**: DP-2 (preferred resolution, auto-position)
- **Gaps**: 5px inner, 20px outer
- **Border**: 2px with custom gradient (rgba(cc7722ff) → rgba(e6b84aff))
- **Rounding**: 2px
- **Layout**: Dwindle

### Key Programs
- **Terminal**: `wezterm`
- **File manager**: `nautilus`
- **Menu**: `rofi -show drun` (Wayland mode)

### Autostart
- `waybar` - Status bar
- `hypridle` - Idle management daemon
- `mpd` - Music Player Daemon

### Keybindings (Super key)
- `Super+Q` - Terminal
- `Super+C` - Kill window
- `Super+F` - File manager
- `Super+Space` - App menu (rofi)
- `Super+1-9` - Switch workspaces
- `Super+H/J/K/L` - Vim-style navigation
- `Super+Shift+L` - Lock screen (hyprlock)

### Idle Management (Hypridle)
- Lock screen after 10 minutes (600s)
- Before sleep: lock session
- After sleep: restore screen (dpms on)

### Screen Lock (Hyprlock)
- Font: JetBrainsMono Nerd Font
- Colors: Catppuccin Mocha (modified mauve #bb9af7)
- Background: Screenshot blur (3 passes, size 7)

## Development Environment

### Language Support
Configured for: **Lua, Python, Rust, Go, JavaScript/TypeScript, JSON**

### Required Tools
- `git` - Version control
- `nvim` (0.10+) - Text editor
- `tmux` - Terminal multiplexer
- `wezterm` - Terminal emulator
- `hyprland` - Window manager (Wayland)
- `rofi` - Application launcher
- `waybar` - Status bar
- `hypridle` - Idle daemon
- `hyprlock` - Screen locker
- `make` - Build system (for telescope-fzf-native)
- `fd` - Fast file finder (optional, for Telescope)
- `ripgrep` - Fast text search (optional, for Telescope)

### LSP/Formatting/Linting
Managed automatically via **Mason** in Neovim:
- LSP servers install on demand
- Formatters: stylua, black, prettier, gofmt, rustfmt
- Linters: luacheck, ruff, eslint_d, golangcilint

### Platform Support
- Primary: macOS (Homebrew integration, pbcopy)
- Also supports: Linux with Wayland (wl-copy) or X11 (xclip)

## Git Workflow

Uses conventional commit style:
- `feat:` - New features
- `fix:` - Bug fixes
- `style:` - Styling/theme updates
- `refactor:` - Code restructuring
- `wip:` - Work in progress

Main branch: `main`

## Installation

No automated setup script is provided. The `.gitignore` references `.stow-local-ignore`, suggesting GNU Stow usage.

To deploy:
1. Clone repository to `~/.dotfiles`
2. Initialize git submodules: `git submodule update --init --recursive`
3. Use GNU Stow: `stow neovim tmux zsh wezterm hypr rofi wallpapers` (from repo root)
   - Or manually symlink directories to home directory
4. Install TPM for tmux: Already in submodules, press `Ctrl-a` + `I` in tmux
5. Install Lazy.nvim for Neovim: Auto-bootstraps on first run
6. Install LSP servers: Open Neovim and run `:Mason` to install language servers

### Git Submodules
- `tmux/.tmux/plugins/tpm` - Tmux Plugin Manager
- `tmux/.tmux/plugins/tmux-resurrect` - Session persistence
- `tmux/.tmux/plugins/catppuccin/tmux` - Legacy theme (not currently used)

## Lua Development

- `.luarc.json` - Lua language server config (vim globals defined)
- `.luacheckrc` - Lua linting configuration
