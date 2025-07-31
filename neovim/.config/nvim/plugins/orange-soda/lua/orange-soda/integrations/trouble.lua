local M = {}

function M.get(c)
	return {
		TroubleText = { fg = c.fg },
		TroubleCount = { fg = c.function_, bg = c.dark_bg },
		TroubleNormal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg },
		FloatBorder = { fg = c.border, bg = c.bg },
		TroubleFile = { fg = c.folder_name },
		TroubleFolder = { fg = c.folder_icon },
		TroubleCode = { fg = c.number },
		TroubleLocation = { fg = c.comment },
		TroubleIndent = { fg = c.comment },
		TroublePreview = { fg = c.fg },
		TroubleSource = { fg = c.comment },
		TroubleWarning = { fg = c.keyword },
		TroubleError = { fg = c.string },
		TroubleHint = { fg = c.type },
		TroubleInformation = { fg = c.function_ },
	}
end

return M
