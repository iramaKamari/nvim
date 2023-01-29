local config = require("plugins.lsp.config")
require("clangd_extensions").setup {
    server = {
        cmd = { "clangd", "-j=12", "--all-scopes-completion=true", "--background-index=true",
            "--fallback-style=llvm",
            "--header-insertion=iwyu", "--suggest-missing-includes=true" };
        capabilities = config.capabilities,
        on_attach = config.on_attach,
    },
}
