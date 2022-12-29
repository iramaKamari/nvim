local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- Nvim settings
require("keymappings")
require("options")

-- Plugins
require("lazy").setup({
	-- PlantUML
	"aklt/plantuml-syntax";
	"tyru/open-browser.vim";
	"weirongxu/plantuml-previewer.vim";
	{"iamcco/markdown-preview.nvim", build = function() vim.fn["mkdp#util#install"]() end };
	-- LSP
	"neovim/nvim-lspconfig";
	"simrat39/rust-tools.nvim";
	"williamboman/mason.nvim";
	"williamboman/mason-lspconfig.nvim";
	-- Rust lsp extension
	"Saecki/crates.nvim";
	"nvim-lua/plenary.nvim"; -- Required by crates.nvim
	-- C/C++ lsp extension
	"p00f/clangd_extensions.nvim";
	-- DAP
	"mfussenegger/nvim-dap";
    "theHamsta/nvim-dap-virtual-text";
	"jbyuki/one-small-step-for-vimkind";
	-- Completion
	"hrsh7th/nvim-cmp";
	"hrsh7th/cmp-nvim-lsp";
	"onsails/lspkind.nvim";
	"hrsh7th/cmp-buffer";
	"hrsh7th/cmp-path";
	"hrsh7th/cmp-cmdline";
	"hrsh7th/cmp-nvim-lsp-signature-help";
	"ray-x/cmp-treesitter";
	-- Snippets
	"L3MON4D3/LuaSnip";
	"saadparwaiz1/cmp_luasnip";
	"rafamadriz/friendly-snippets";
	-- Fuzzy finding of files/buffers etc
	{ "junegunn/fzf", build = "./install --bin" };
	{ "ibhagwan/fzf-lua", branch = "main" };
	-- Different color for selected search match
	"PeterRincker/vim-searchlight";
	-- Better quickfix list
	"kevinhwang91/nvim-bqf";
	-- Syntax highlighters
	{ "nvim-treesitter/nvim-treesitter", build = function() vim.cmd "TSUpdate" end };
	"nvim-treesitter/playground";
	"frazrepo/vim-rainbow";
	"ChristianChiarulli/nvcode-color-schemes.vim";
	"chrisbra/Colorizer";
	-- Ergonomics
	"folke/zen-mode.nvim";
})

-- Plugin settings
require("better_quick_fix_settings")
require("cmp_settings")
require("fzf_settings")
require("scratch")
require("zen_mode_settings")

-- Lazy load LSP servers
require("lsp.load_server")

-- Syntax, colorScheme settings
require("nvim_treesitter_settings")
require("colorscheme")
require("statusline")
require("tabline")
