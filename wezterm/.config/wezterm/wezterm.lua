local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Explicitly configure font with no features/ligatures
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	weight = "Regular",
	stretch = "Normal",
	style = "Normal",
})
config.font_size = 12.0
config.line_height = 1.25

-- Disable font ligatures (FiraCode has coding ligatures by default)
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- Font rendering settings to prevent synthetic emboldening
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.freetype_load_flags = "NO_HINTING"

-- Disable bold font variants to prevent synthetic emboldening
config.bold_brightens_ansi_colors = false

config.color_scheme = "Kanagawa Dragon (Gogh)"

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"
config.macos_window_background_blur = 10

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

return config
