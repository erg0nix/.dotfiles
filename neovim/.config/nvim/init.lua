-- Enable syntax and filetype settings
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- Basic settings
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.wildmenu = true
vim.opt.clipboard = "unnamedplus"

-- Completion options for LSP
vim.o.completeopt = "menuone,noinsert,noselect"

-- Insert mode undo break mappings to create granular undo points
vim.cmd [[
  inoremap <Space> <Space><C-g>u
  inoremap . .<C-g>u
  inoremap , ,<C-g>u
  inoremap ( (<C-g>u
  inoremap ) )<C-g>u
  inoremap ; ;<C-g>u
  inoremap : :<C-g>u
  inoremap " "<C-g>u
  inoremap ' '<C-g>u
  inoremap = =<C-g>u
  inoremap <CR> <CR><C-g>u
]]

-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
    -- Statusline
    { "nvim-lualine/lualine.nvim" },
    -- Tree
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                filters = { 
                    dotfiles = false,
                    custom = {},
                    exclude = { "scripts", ".env.*" },
                },
                renderer = {
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                        },
                    }
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")

                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    api.config.mappings.default_on_attach(bufnr)
                    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
                    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in vertical split"))
                    vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open in horizontal split"))
                    vim.keymap.set("n", "t", api.node.open.tab, opts("Open in new tab"))
                    vim.keymap.set("n", "q", api.tree.close, opts("Close nvim-tree"))
                end
            })
        end,
    },

    -- Treesitter for syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "jay-babu/mason-null-ls.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },

    -- Auto-completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },

    -- Linting & Formatting
    { "stevearc/conform.nvim" },
    { "mfussenegger/nvim-lint" },

    {
        'mrcjkb/rustaceanvim',
        version = '^5',
        lazy = false,
    },
    { 'rust-lang/rust.vim' },
})

vim.cmd[[colorscheme tokyonight-night]]
vim.cmd([[ highlight NvimTreeNormal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE ]])

-- Ensure keymaps load after Lazy.nvim initializes
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function()
        vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
})

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "javascript", "tsx", "json", "go" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Mason & LSP configuration
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls", "jsonls", "gopls" },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local servers = {
  lua_ls = {},
  pyright = {},
  ts_ls = {},
  jsonls = {},
  gopls = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(config)
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or '■', '▎', etc.
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float(nil, { focusable = true, border = "rounded" })
end, { noremap = true, silent = true })



-- Map Ctrl+B to jump to definition
vim.keymap.set('n', '<C-b>', vim.lsp.buf.definition, { noremap = true, silent = true })

-- Map Ctrl+K to show hover documentation
vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { noremap = true, silent = true })


-- Linting
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

-- Formatting
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

require("lualine").setup()
