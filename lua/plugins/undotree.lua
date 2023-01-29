return {
	"jiaoshijie/undotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function ()
		require("undotree").setup()
		vim.keymap.set("n", "<leader>u", function()
			require("undotree").toggle()
		end, { noremap = true, silent = true })
	end
}
