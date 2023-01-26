return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>z", function() require("zen-mode").toggle() end },
  },
  config = function()
    require("zen-mode").setup {
      window = {
	width = 85,
	options = {
	  number = true,
	  relativenumber = true,
	},
      },
    }
  end,
}
