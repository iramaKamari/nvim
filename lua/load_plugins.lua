-- Plugins
require "paq" {
	"savq/paq-nvim";
	-- PlantUML
	"aklt/plantuml-syntax";
	"tyru/open-browser.vim";
	"weirongxu/plantuml-previewer.vim";
	-- LSP
	"neovim/nvim-lspconfig";
	"simrat39/rust-tools.nvim";
	"p00f/clangd_extensions.nvim";
	-- Completion
	"hrsh7th/nvim-cmp";
	"hrsh7th/cmp-nvim-lsp";
	"onsails/lspkind.nvim";
	"hrsh7th/cmp-buffer";
	"hrsh7th/cmp-path";
	"hrsh7th/cmp-cmdline";
	"hrsh7th/cmp-nvim-lsp-signature-help";
	"ray-x/cmp-treesitter";
	---- Rust
	"Saecki/crates.nvim";
	"nvim-lua/plenary.nvim"; -- Required by crates.nvim
	-- Snippets
	"L3MON4D3/LuaSnip";
	"saadparwaiz1/cmp_luasnip";
	"rafamadriz/friendly-snippets";
	-- Fuzzy finding of files/buffers etc
	{ "junegunn/fzf", run = "./install --bin" };
	{ "ibhagwan/fzf-lua", branch = "main" };
	-- Different color for selected search match
	"PeterRincker/vim-searchlight";
	-- Better quickfix list
	"kevinhwang91/nvim-bqf";
	-- Syntax highlighters
	{ "nvim-treesitter/nvim-treesitter", run = function() vim.cmd "TSUpdate" end };
	"nvim-treesitter/playground";
	"frazrepo/vim-rainbow";
	"ChristianChiarulli/nvcode-color-schemes.vim";
	"chrisbra/Colorizer";
	-- Ergonomics
	"folke/zen-mode.nvim";
	-- Tpope
	"tpope/vim-surround";
	"tpope/vim-repeat";
}

-- Nvim settings
require("keymappings")
require("options")

-- Plugin settings
require("plantuml_settings")
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
