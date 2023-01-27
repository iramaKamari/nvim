return {
    {
        dir = "~/.config/nvim/colors/gruvbox_modified.vim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[syntax on]])
            vim.cmd([[silent! colorscheme gruvbox_modified]])
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        --config = function()
        --    require("rose-pine").setup()
        --    vim.cmd('colorscheme rose-pine')
	    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        --end
    },
    {
       'norcalli/nvim-colorizer.lua',
        name = 'colorizer',
        config = true,
    },
}
