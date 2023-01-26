local config = require("plugins.lsp.config")
vim.api.nvim_buf_set_keymap(config.buffer, "n", "<leader>h", ":ClangdSwitchSourceHeader<CR>", { silent = true })
require("clangd_extensions").setup {
    server = {
        cmd = { 'clangd', '-j=12', '--all-scopes-completion=true', '--background-index=true',
            '--fallback-style=llvm',
            '--header-insertion=iwyu', '--suggest-missing-includes=true' };
        capabilities = config.capabilities,
        on_attach = config.on_attach,
    },
}
