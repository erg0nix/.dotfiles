# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managing configuration files for a minimal, developer-focused environment. The repository uses a standard dotfiles structure where each top-level directory contains configuration files that mirror the home directory layout (e.g., `neovim/.config/nvim`).

## Active Tools

The repository currently manages configurations for:
- **neovim** - Primary text editor with LSP, debugging, and language support
- **tmux** - Terminal multiplexer with session persistence
- **wezterm** - Terminal emulator
- **zsh** - Shell with Oh My Zsh
- **hypr** - Hyprland window manager (Wayland)
- **wallpapers** - Desktop wallpapers

## Theme

**Catppuccin Mocha** is the unified theme across all tools:
- Neovim (with transparent background)
- Tmux status bar
- Wezterm terminal
- Hyprland borders (gradient: peach to yellow)

## Neovim Configuration

### Architecture
- **Entry point**: `neovim/.config/nvim/init.lua`
- **Core config**: `neovim/.config/nvim/lua/` (settings.lua, keymaps.lua, plugins.lua)
- **Plugin configs**: `neovim/.config/nvim/after/plugin/` (lsp.lua, cmp.lua, dap.lua, etc.)
- **Plugin manager**: Lazy.nvim (auto-bootstraps on first run)

### LSP Setup
Uses **native vim.lsp.config** (Neovim 0.11+, no nvim-lspconfig plugin). LSP servers configured in `after/plugin/lsp.lua:5-52`:
- `lua_ls` - Lua language server (with vim globals)
- `pyright` - Python language server
- `ts_ls` - TypeScript/JavaScript language server
- `jsonls` - JSON language server
- `gopls` - Go language server (with analyses: unusedparams, shadow, staticcheck)

Each server is configured with:
- `cmd` - Command to start the LSP server
- `filetypes` - File types the server should handle
- `root_markers` - Files that indicate the project root
- `settings` - Server-specific settings

LSP servers must be installed manually on the system (e.g., via `npm install -g`, `go install`, etc.).

### Key Plugins
- **Theme**: catppuccin/nvim (transparent background enabled)
- **Completion**: nvim-cmp (sources: LSP, buffer, path, cmdline) + LuaSnip
- **File navigation**: nvim-tree, telescope.nvim (with fzf-native)
- **Syntax**: nvim-treesitter
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Debugging**: nvim-dap, nvim-dap-ui, nvim-dap-go
- **Rust**: rustaceanvim, rust.vim
- **Diagnostics**: Trouble.nvim
- **UI**: lualine, nvim-web-devicons

### Key Keybindings
- `<C-n>` - Toggle file tree
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep
- `<leader>e` - Open diagnostic float
- `<C-b>` - Go to definition
- `<C-k>` - Hover documentation
- `<leader>xx` - Toggle diagnostics (Trouble)

### Plugin Management
Update plugins: Open Neovim and run `:Lazy sync`

## Tmux Configuration

### Key Features
- **Prefix**: `Ctrl-a` (not default Ctrl-b)
- **Vi mode**: Enabled in copy mode
- **Mouse support**: Enabled
- **Plugin path**: `$HOME/.dotfiles/tmux/.tmux/plugins`

### Plugins (TPM)
- `tmux-plugins/tmux-resurrect` - Session persistence
- `catppuccin/tmux#v2.1.3` - Theme (Mocha flavor)

Additional modules loaded:
- `tmux-cpu` - CPU status in status bar
- `tmux-battery` - Battery status

### Installing/Updating Plugins
Press `Ctrl-a` + `I` (uppercase i) inside tmux

### Custom Keybindings
- `Ctrl-a` + `r` - Reload config
- `Ctrl-a` + `|` - Split horizontally
- `Ctrl-a` + `-` - Split vertically
- `Ctrl-a` + `h/j/k/l` - Vim-style pane navigation
- `y` in copy mode - Copy to system clipboard (macOS: pbcopy, Linux: wl-copy/xclip)

### Status Bar
Right side shows: application | cpu | session | uptime | battery

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

## Wezterm Configuration

Minimal terminal emulator setup:
- **Font**: FiraCode Nerd Font (size 12)
- **Theme**: Catppuccin Mocha
- **Opacity**: 85% with 10px macOS blur
- **Tab bar**: Disabled
- **Padding**: 8px all sides

## Hyprland Configuration

### Display
- Monitor: DP-2 (preferred resolution, auto-position)
- Gaps: 5px inner, 20px outer
- Border: 2px with Catppuccin-inspired gradient
- Rounding: 2px

### Key Programs
- Terminal: `wezterm`
- File manager: `nautilus`
- Menu: `rofi` (Wayland mode)

### Keybindings (Super key)
- `Super+Q` - Terminal
- `Super+C` - Kill window
- `Super+F` - File manager
- `Super+Space` - App menu (rofi)
- `Super+1-9` - Switch workspaces
- `Super+H/J/K/L` - Vim-style navigation
- `Super+Shift+L` - Lock screen (hyprlock)

## Development Environment

### Language Support
Configured for: **Lua, Python, Rust, Go, JavaScript/TypeScript, JSON**

### Required Tools
- `git` - Version control
- `nvim` - Text editor
- `tmux` - Terminal multiplexer
- `wezterm` - Terminal
- `make` - Build system (for telescope-fzf-native)
- LSP servers (lua-language-server, pyright, typescript-language-server, gopls, etc.)
- Formatters (stylua, black, rustfmt, prettier, gofmt)
- Linters (luacheck, ruff, clippy, eslint_d, golangcilint)

### Platform Support
- Primary: macOS (Homebrew integration, pbcopy)
- Also supports: Linux with Wayland (wl-copy) or X11 (xclip)

## Git Workflow

Uses conventional commit style:
- `feat:` - New features
- `fix:` - Bug fixes
- `style:` - Styling/theme updates
- `refactor:` - Code restructuring

Main branch: `main`

## Installation

No automated setup script is provided. The `.gitignore` references `.stow-local-ignore`, suggesting GNU Stow usage.

To deploy:
1. Clone repository to `~/.dotfiles`
2. Initialize git submodules: `git submodule update --init --recursive`
3. Use GNU Stow: `stow neovim tmux zsh wezterm hypr` (from repo root)
   - Or manually symlink directories to home directory
4. Install TPM for tmux: Already in submodules
5. Install Lazy.nvim for Neovim: Auto-bootstraps on first run
6. Install LSP servers manually (no Mason)

## Lua Development

- `.luarc.json` - Lua language server config (vim globals defined)
- `.luacheckrc` - Lua linting configuration
