local M = {}

M.options = {
	transparent = false,
}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
	require("orange-soda.theme").load(M.options)
end

return M
