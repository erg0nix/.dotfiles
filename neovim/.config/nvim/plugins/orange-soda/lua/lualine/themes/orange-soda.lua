local c = require("orange-soda.theme").colors

local shared = {
	a = { fg = c.accent_fg, bg = c.border, gui = "bold" },
	b = { fg = c.fg, bg = c.dark_bg },
	c = { fg = c.fg, bg = c.accent_fg },
}

return {
	normal = shared,
	insert = shared,
	visual = shared,
	replace = shared,
	command = shared,
	inactive = shared,
}
