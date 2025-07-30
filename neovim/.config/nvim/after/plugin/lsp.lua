require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "ts_ls", "jsonls", "gopls" },
	automatic_installation = true,
})

local lspconfig = require("lspconfig")
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	pyright = {},
	ts_ls = {},
	jsonls = {},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
			},
		},
	},
}

for name, config in pairs(servers) do
	lspconfig[name].setup(config)
end

vim.diagnostic.config({
	virtual_text = { prefix = "●" },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focusable = true, border = "rounded" })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-b>", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, { noremap = true, silent = true })
