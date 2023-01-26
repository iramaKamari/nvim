-- Go
vim.api.nvim_exec([[autocmd FileType go setlocal omnifunc=v:lua.vim.omnifunc]], false)
vim.api.nvim_exec([[autocmd BufWritePre *.go lua Go_org_imports()]], false)
function Go_org_imports(wait_ms)
	local params = vim.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
				vim.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

local config = require("plugins.lsp.config")
config.lsp.gopls.setup {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = config.lsp.util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	on_attach = config.on_attach,
	capabilities = config.capabilities,
}
