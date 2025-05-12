-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Use config builder for clean structure and diagnostics
local config = wezterm.config_builder()

-- Font and appearance
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14.0
config.color_scheme = "Tokyo Night"

-- Window behavior
config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- Padding (optional)
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.default_prog = { "/bin/zsh", "-l", "-c", "tmux new-session -A -s main" }

-- Done!
return config

