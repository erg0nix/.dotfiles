require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "rust", "javascript", "tsx", "json", "go" },
	highlight = { enable = true },
	indent = { enable = true },
})
