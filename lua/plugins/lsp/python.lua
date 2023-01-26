local config = require("plugins.lsp.config")
config.lsp.pylsp.setup {
	on_attach = config.on_attach,
	capabilities = config.capabilities,
}
