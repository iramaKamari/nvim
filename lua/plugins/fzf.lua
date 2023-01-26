local keymap_opts = { noremap = true, silent = false }
return {
  "ibhagwan/fzf-lua",


  keys = {
	{ "§", function() require("fzf-lua").buffers() end, keymap_opts },
	{ "<leader>g", function() require("fzf-lua").live_grep() end, keymap_opts },
	{ "<leader>G", function() require("fzf-lua").grep_cword() end, keymap_opts },
	{ "<leader>e", ":FzfLua<space>", keymap_opts },
	{ "<leader>F", function() require("fzf-lua").files({ cmd = "fd --color=always --type f --hidden --follow --exclude .git", cwd = vim.fn.fnamemodify(vim.fn.bufname(), ':p:h') .. "/", actions = { ["default"] = require("fzf-lua.actions").file_edit } }) end, keymap_opts },
	{ "<leader>f", function() require("fzf-lua").files({ cmd = "fd --color=always --type f --hidden --follow --exclude .git", actions = { ["default"] = require("fzf-lua.actions").file_edit } }) end, keymap_opts },
      },
      config = function()
	require("fzf-lua").setup({
	  winopts = {
		preview = {
			wrap = 'wrap',
			vertical = 'down:70%',
			layout = 'vertical',
		},
	  },
	})
      end,
}
