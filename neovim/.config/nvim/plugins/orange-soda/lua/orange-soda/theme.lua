local M = {}

M.colors = {
	fg = "#ebdbb2",
	bg = "#1d130e",
	dark_bg = "#17100b",

	border = "#cc7722",
	comment = "#665040",
	string = "#d68a4a",
	number = "#c87535",
	keyword = "#d65d0e",
	function_ = "#e6b84a",
	variable = "#b85e28",
	type = "#e0a458",

	accent_fg = "#2c1a0f",

	delimiter = "#a5694f",
	folder_name = "#c86e28",
	folder_icon = "#da9248",

	escape = "#e0bb4f",
}

local function load_integrations(c)
	local integrations = {
		"cmp",
		"telescope",
		"trouble",
		"dap",
		"nvimtree",
		"treesitter",
	}

	for _, name in ipairs(integrations) do
		local ok, mod = pcall(require, "orange-soda.integrations." .. name)
		if ok and mod.get then
			for hl, val in pairs(mod.get(c)) do
				vim.api.nvim_set_hl(0, hl, val)
			end
		end
	end
end

M.load = function(opts)
	opts = opts or {}
	local c = M.colors
	local bg = opts.transparent and "NONE" or c.bg
	local cursorline_bg = opts.transparent and "NONE" or c.dark_bg

	vim.cmd("highlight clear")
	vim.cmd("syntax reset")
	vim.o.background = "dark"
	vim.g.colors_name = "orange-soda"

	local hl = vim.api.nvim_set_hl

	hl(0, "Normal", { fg = c.fg, bg = bg })
	hl(0, "NormalNC", { fg = c.fg, bg = bg })
	hl(0, "CursorLine", { bg = cursorline_bg })
	hl(0, "Visual", { bg = c.comment })
	hl(0, "LineNr", { fg = c.comment })
	hl(0, "VertSplit", { fg = c.border })
	hl(0, "StatusLine", { fg = c.bg, bg = c.border })
	hl(0, "Pmenu", { fg = c.fg, bg = c.dark_bg })
	hl(0, "PmenuSel", { fg = c.bg, bg = c.border })

	hl(0, "Comment", { fg = c.comment, italic = true })
	hl(0, "Constant", { fg = c.number })
	hl(0, "String", { fg = c.string })
	hl(0, "Identifier", { fg = c.variable })
	hl(0, "Function", { fg = c.function_ })
	hl(0, "Statement", { fg = c.keyword, bold = true })
	hl(0, "Type", { fg = c.type })
	hl(0, "PreProc", { fg = c.keyword })

	hl(0, "ModeMsg", { fg = c.border })
	hl(0, "MsgArea", { fg = c.border })
	hl(0, "NormalMode", { fg = c.border })
	hl(0, "InsertMode", { fg = c.function_ })
	hl(0, "VisualMode", { fg = c.variable })
	hl(0, "ReplaceMode", { fg = c.keyword })

	load_integrations(c)
end

return M
