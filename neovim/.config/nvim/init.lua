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
vim.o.completeopt = "menuone,noinsert,noselect"

-- Insert mode undo break mappings
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
        opts = { transparent = true },
    },
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

    -- Telescope with FZF
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = vim.fn.executable("make") == 1,
            },
        },
        config = function()
            require("telescope").setup()
            pcall(require("telescope").load_extension, "fzf")
        end,
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim" },
    { "jay-babu/mason-null-ls.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },

    -- Completion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "onsails/lspkind.nvim" },
    { "L3MON4D3/LuaSnip" },

    -- Formatting / Linting
    { "stevearc/conform.nvim" },
    { "mfussenegger/nvim-lint" },

    -- Better diagnostics UI
    { "folke/trouble.nvim", opts = {} },

    -- Debugging
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "nvim-neotest/nvim-nio" }, -- Required by dap-ui
    {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end
    },

    -- Rust
    { "mrcjkb/rustaceanvim", version = "^5", lazy = false },
    { "rust-lang/rust.vim" },
})

-- Theme and transparent tree
vim.cmd[[colorscheme tokyonight-night]]
vim.cmd([[ highlight NvimTreeNormal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ highlight NvimTreeNormalNC guibg=NONE ctermbg=NONE ]])
vim.cmd([[ highlight NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE ]])

-- Lazy-load keymaps
vim.api.nvim_create_autocmd("User", {
    pattern = "LazyLoad",
    callback = function()
        vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>xx', "<cmd>TroubleToggle<cr>", { noremap = true, silent = true })
    end,
})

-- Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "javascript", "tsx", "json", "go" },
  highlight = { enable = true },
  indent = { enable = true },
})

-- Mason + LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "ts_ls", "jsonls", "gopls" }, -- ts_ls instead of deprecated tsserver
  automatic_installation = true,
})

-- LSP servers
local lspconfig = require("lspconfig")
local servers = {
  lua_ls = {},
  pyright = {},
  ts_ls = {}, -- use ts_ls here too
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

-- LSP UI
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float(nil, { focusable = true, border = "rounded" })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<C-b>', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, { noremap = true, silent = true })

-- Completion
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 }),
  },
  snippet = {
    expand = function(args) require("luasnip").lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
  }),
})

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
  callback = function() require("lint").try_lint() end,
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

-- DAP UI (safe load)
local dap_status, dapui = pcall(require, "dapui")
if dap_status then
  local dap = require("dap")
  dapui.setup()
  dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
  dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
  dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
end

-- DAP keymaps
vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)

-- Statusline
require("lualine").setup()

