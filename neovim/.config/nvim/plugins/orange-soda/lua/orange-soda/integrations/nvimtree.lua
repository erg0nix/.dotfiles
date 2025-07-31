local M = {}

function M.get(c)
	return {
		NvimTreeNormal = { fg = c.fg, bg = "NONE" },
		NvimTreeNormalNC = { fg = c.fg, bg = "NONE" },
		NvimTreeEndOfBuffer = { fg = c.comment, bg = "NONE" },
		NvimTreeFolderName = { fg = c.folder_name },
		NvimTreeFolderIcon = { fg = c.folder_icon },
		NvimTreeOpenedFolderName = { fg = c.folder_name, bold = true },
		NvimTreeIndentMarker = { fg = c.delimiter },
		NvimTreeExecFile = { fg = c.function_ },
		NvimTreeImageFile = { fg = c.string },
		NvimTreeSpecialFile = { fg = c.keyword, underline = true },
		NvimTreeSymlink = { fg = c.type },
		NvimTreeGitDirty = { fg = c.keyword },
		NvimTreeGitNew = { fg = c.function_ },
		NvimTreeGitDeleted = { fg = c.comment },
		NvimTreeRootFolder = { fg = c.border, bold = true },
		NvimTreeWinSeparator = { fg = c.border },
	}
end

return M
