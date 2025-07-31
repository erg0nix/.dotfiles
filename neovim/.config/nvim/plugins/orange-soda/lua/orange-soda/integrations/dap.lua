local M = {}

function M.get(c)
	return {
		DapStoppedLine = { bg = c.dark_bg },

		DapBreakpoint = { fg = c.keyword },
		DapBreakpointCondition = { fg = c.string },
		DapBreakpointRejected = { fg = c.comment },
		DapLogPoint = { fg = c.function_ },
		DapStopped = { fg = c.type },

		DapStoppedLineHL = { fg = c.fg, bg = c.bg },
		DapUIVariable = { fg = c.variable },
		DapUIScope = { fg = c.keyword },
		DapUIType = { fg = c.type },
		DapUIValue = { fg = c.string },
		DapUIModifiedValue = { fg = c.function_ },
		DapUIDecoration = { fg = c.comment },
		DapUIThread = { fg = c.fg },
		DapUIStoppedThread = { fg = c.variable },
		DapUISource = { fg = c.folder_name },
		DapUILineNumber = { fg = c.comment },
		DapUIFloatBorder = { fg = c.border },

		DapUIBreakpointsCurrentLine = { fg = c.function_ },
		DapUIBreakpointsPath = { fg = c.folder_icon },
		DapUIBreakpointsInfo = { fg = c.keyword },

		DapUIFrameName = { fg = c.fg },
		DapUIWatchesEmpty = { fg = c.comment },
		DapUIWatchesValue = { fg = c.string },
		DapUIWatchesError = { fg = c.keyword },
	}
end

return M
