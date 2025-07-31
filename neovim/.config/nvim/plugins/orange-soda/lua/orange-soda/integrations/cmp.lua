local M = {}

function M.get(c)
	return {
		CmpDocumentation = { fg = c.fg, bg = c.dark_bg },
		CmpDocumentationBorder = { fg = c.border, bg = c.dark_bg },
		CmpGhostText = { fg = c.comment },

		CmpItemAbbr = { fg = c.fg },
		CmpItemAbbrDeprecated = { fg = c.comment, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.keyword },
		CmpItemAbbrMatchFuzzy = { fg = c.keyword },

		CmpItemKindDefault = { fg = c.variable },
		CmpItemKindFunction = { fg = c.function_ },
		CmpItemKindMethod = { fg = c.function_ },
		CmpItemKindConstructor = { fg = c.function_ },
		CmpItemKindField = { fg = c.variable },
		CmpItemKindVariable = { fg = c.variable },
		CmpItemKindClass = { fg = c.type },
		CmpItemKindInterface = { fg = c.type },
		CmpItemKindModule = { fg = c.folder_icon },
		CmpItemKindProperty = { fg = c.variable },
		CmpItemKindUnit = { fg = c.number },
		CmpItemKindValue = { fg = c.number },
		CmpItemKindEnum = { fg = c.type },
		CmpItemKindKeyword = { fg = c.keyword },
		CmpItemKindSnippet = { fg = c.string },
		CmpItemKindColor = { fg = c.number },
		CmpItemKindFile = { fg = c.fg },
		CmpItemKindReference = { fg = c.keyword },
		CmpItemKindFolder = { fg = c.folder_name },
		CmpItemKindEnumMember = { fg = c.type },
		CmpItemKindConstant = { fg = c.number },
		CmpItemKindStruct = { fg = c.type },
		CmpItemKindEvent = { fg = c.keyword },
		CmpItemKindOperator = { fg = c.keyword },
		CmpItemKindTypeParameter = { fg = c.type },

		CmpItemMenu = { fg = c.comment },
	}
end

return M
