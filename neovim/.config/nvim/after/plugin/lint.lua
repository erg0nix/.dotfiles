require("lint").linters_by_ft = {
	lua = { "luacheck" },
	python = { "ruff" },
	rust = { "clippy" },
	javascript = { "eslint_d" },
	tsx = { "eslint_d" },
	json = { "jsonlint" },
	go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
