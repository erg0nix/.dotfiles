local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0

config.colors = {
  foreground = "#E6E1D9",
  background = "#0F1115",
  cursor_bg = "#FF7A33",
  cursor_fg = "#0F1115",
  cursor_border = "#FF7A33",
  selection_fg = "#E6E1D9",
  selection_bg = "#24313A",

  ansi = {
    "#0F1115",
    "#FF7A33",
    "#8BB572",
    "#E0B467",
    "#5FA3A3",
    "#B9814C",
    "#7FB8B8",
    "#E6E1D9",
  },

  brights = {
    "#6B6F76",
    "#FF965B",
    "#A5C98E",
    "#EAD18E",
    "#8EC3C3",
    "#D7B46A",
    "#A7DADA",
    "#F2EEE9",
  },

  tab_bar = {
    background = "#0F1115",
    active_tab = {
      bg_color = "#B86A2B",
      fg_color = "#0F1115",
    },
    inactive_tab = {
      bg_color = "#161A1F",
      fg_color = "#6B6F76",
    },
    inactive_tab_hover = {
      bg_color = "#161A1F",
      fg_color = "#E0B467",
    },
    new_tab = {
      bg_color = "#0F1115",
      fg_color = "#B86A2B",
    },
  },
}

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

return config

