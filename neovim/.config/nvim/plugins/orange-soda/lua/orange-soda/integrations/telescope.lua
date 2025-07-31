local M = {}

function M.get(c)
	return {
		TelescopeBorder = { fg = c.border, bg = c.dark_bg },
		TelescopePromptBorder = { fg = c.keyword, bg = c.dark_bg },
		TelescopePromptTitle = { fg = c.keyword, bg = c.dark_bg },
		TelescopeNormal = { fg = c.fg, bg = c.dark_bg },
		TelescopeSelection = { fg = c.fg, bg = c.bg },
		TelescopeMatching = { fg = c.keyword },
		TelescopeResultsTitle = { fg = c.border },
		TelescopeResultsBorder = { fg = c.border, bg = c.dark_bg },
		TelescopePreviewBorder = { fg = c.border, bg = c.dark_bg },
		TelescopePreviewTitle = { fg = c.fg, bg = c.dark_bg },
		TelescopeResultsComment = { fg = c.comment },
	}
end

return M
