local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lualine/lualine.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = vim.fn.executable("make") == 1,
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "onsails/lspkind.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{ "stevearc/conform.nvim" },
	{ "mfussenegger/nvim-lint" },
	{
		"folke/trouble.nvim",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle Trouble diagnostics" },
			{ "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
			{ "<leader>xd", "<cmd>Trouble document_diagnostics toggle<CR>", desc = "Document Diagnostics" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle<CR>", desc = "Symbols" },
			{ "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>", desc = "LSP References" },
		},
		opts = {},
	},
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "nvim-neotest/nvim-nio" },
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	},
	{ "mrcjkb/rustaceanvim", version = "^5", lazy = false },
	{ "rust-lang/rust.vim" },
})
