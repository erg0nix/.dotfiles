local M = {}

function M.get(c)
	return {
		["@comment"] = { fg = c.comment, italic = true },
		["@string"] = { fg = c.string },
		["@string.escape"] = { fg = c.escape },
		["@string.special"] = { fg = c.escape },
		["@number"] = { fg = c.number },
		["@boolean"] = { fg = c.number },
		["@constant"] = { fg = c.number },
		["@constant.builtin"] = { fg = c.function_, bold = true },
		["@character"] = { fg = c.string },

		["@function"] = { fg = c.function_ },
		["@function.builtin"] = { fg = c.function_, bold = true },
		["@function.call"] = { fg = c.function_ },
		["@constructor"] = { fg = c.function_, bold = true },

		["@keyword"] = { fg = c.keyword, bold = true },
		["@keyword.return"] = { fg = c.keyword },
		["@keyword.function"] = { fg = c.keyword },
		["@keyword.operator"] = { fg = c.keyword },
		["@operator"] = { fg = c.border },

		["@variable"] = { fg = c.variable },
		["@variable.builtin"] = { fg = c.function_ },
		["@variable.parameter"] = { fg = c.fg },

		["@type"] = { fg = c.type },
		["@type.builtin"] = { fg = c.function_ },

		["@field"] = { fg = c.variable },
		["@property"] = { fg = c.variable },

		["@punctuation.delimiter"] = { fg = c.delimiter },
		["@punctuation.bracket"] = { fg = c.delimiter },
		["@punctuation.special"] = { fg = c.escape },

		["@tag"] = { fg = c.keyword },
		["@tag.attribute"] = { fg = c.variable },
		["@tag.delimiter"] = { fg = c.delimiter },

		["@module"] = { fg = c.folder_name },
		["@namespace"] = { fg = c.folder_icon },
		["@include"] = { fg = c.keyword },

		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.link"] = { fg = c.keyword, underline = true },
		["@markup.heading"] = { fg = c.border, bold = true },
	}
end

return M
