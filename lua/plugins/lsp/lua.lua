local config = require("plugins.lsp.config")
config.lsp.sumneko_lua.setup {
	on_attach = config.on_attach,
	capabilities = config.capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "5.4.4",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
