require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black", "isort" },
		rust = { "rustfmt" },
		javascript = { "prettier" },
		tsx = { "prettier" },
		json = { "prettier" },
		go = { "goimports", "gofmt" },
	},
	format_on_save = true,
})
