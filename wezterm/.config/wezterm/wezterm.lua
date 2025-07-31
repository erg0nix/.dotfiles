local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font and appearance
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0

-- Match orange-soda.nvim
config.colors = {
	foreground = "#ebdbb2",
	background = "#1d130e",
	cursor_bg = "#e6b84a",
	cursor_fg = "#1d130e",
	cursor_border = "#e6b84a",
	selection_fg = "#1d130e",
	selection_bg = "#e6b84a",

	ansi = {
		"#1d130e", -- black
		"#d65d0e", -- red
		"#b85e28", -- green
		"#e6b84a", -- yellow
		"#cc7722", -- blue (used loosely)
		"#da9248", -- magenta (used for folder icons)
		"#d68a4a", -- cyan
		"#ebdbb2", -- white
	},

	brights = {
		"#665040", -- bright black (comment)
		"#fc803a", -- bright red (number)
		"#e07b4f", -- bright green (variable alt)
		"#fff44f", -- bright yellow (function)
		"#ffad42", -- bright blue (icon)
		"#fab387", -- bright magenta (type)
		"#ffe066", -- bright cyan (escape)
		"#ebdbb2", -- bright white
	},

	tab_bar = {
		background = "#1d130e",
		active_tab = {
			bg_color = "#cc7722",
			fg_color = "#1d130e",
		},
		inactive_tab = {
			bg_color = "#17100b",
			fg_color = "#665040",
		},
		inactive_tab_hover = {
			bg_color = "#17100b",
			fg_color = "#e6b84a",
		},
		new_tab = {
			bg_color = "#1d130e",
			fg_color = "#e6b84a",
		},
	},
}

-- Window behavior
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
