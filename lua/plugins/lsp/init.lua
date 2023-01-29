local servers = { "lua", "python", "clangd", "go", "python", "rust" }
return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"jay-babu/mason-null-ls.nvim",
				dependencies = {
					"jose-elias-alvarez/null-ls.nvim",
				},
			},
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({})
			for _, server in pairs(servers) do
				require("plugins.lsp." .. server)
			end
			require("mason-null-ls").setup({
				ensure_installed = {
					"buildifier", -- Bazel
					"clang_format",
					"hadolint", -- Dockerfile
					"gitlint",
					"prettierd", -- json, js, markdown and other typescript versions
					"stylua",
					"black", -- Python
					"flake8", -- Python
				},
				automatic_setup = true,
			})
			require("null-ls").setup()
			require("mason-null-ls").setup_handlers()
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			{
				"Saecki/crates.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim", -- Required by crates.nvim
				},
			},
		},
	},
	{
		"p00f/clangd_extensions.nvim",
	},
}
