-- Lexplore
-- return {
-- 	"francoiscabrol/ranger.vim",
-- 	dependencies = {
-- 		"rbgrouleff/bclose.vim",
-- 	},
-- 	config = function()
-- 		vim.cmd([[
--             let g:ranger_map_keys = 0
--             let g:ranger_replace_netrw = 1
--         ]])
-- 		vim.keymap.set("n", "<leader>l", ":Ranger<CR>", { noremap = true, silent = true })
-- 	end,
-- }
return {
	"prichrd/netrw.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("netrw").setup({
			mappings = {
				["p"] = function(payload)
					-- Payload is an object describing the node under the cursor, the object
					-- has the following keys:
					-- - dir: the current netrw directory (vim.b.netrw_curdir)
					-- - node: the name of the file or directory under the cursor
					-- - link: the referenced file if the node under the cursor is a symlink
					-- - extension: the file extension if the node under the cursor is a file
					-- - type: the type of node under the cursor (0 = dir, 1 = file, 2 = symlink)
					print(vim.inspect(payload))
				end,
			},
		})
        -- Current file directory
		vim.keymap.set("n", "<leader>l", vim.cmd.Vexplore, { noremap = true, silent = true })
        -- Current working directory
		vim.keymap.set("n", "<leader>L", vim.cmd.Lexplore, { noremap = true, silent = true })
	end,
}
