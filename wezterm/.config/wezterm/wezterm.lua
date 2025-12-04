local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0
config.line_height = 1.25

config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
--config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

return config

