local M = {}
-- Lsp settings
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
M.lsp = require("lspconfig")
M.capabilities = require("cmp_nvim_lsp").default_capabilities()
M.on_attach = function(client, bufnr)
	local fzf = require("fzf-lua")
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
	vim.diagnostic.config({ virtual_text = false })
	vim.keymap.set("n", "gD", fzf.lsp_declarations, opts)
	vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
	vim.keymap.set("n", "gr", fzf.lsp_references, opts)
	vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
	vim.keymap.set("n", "gic", fzf.lsp_incoming_calls, opts)
	vim.keymap.set("n", "goc", fzf.lsp_outgoing_calls, opts)
	vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gwa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "gwr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "gwl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "gds", fzf.lsp_document_symbols, opts)
	vim.keymap.set("n", "gws", fzf.lsp_live_workspace_symbols, opts)
	vim.keymap.set("n", "<leader>d", fzf.lsp_typedefs, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, opts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
	if client.name == "clangd" then
		vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<CR>", opts)
	end
end
return M
