local servers = { "lua", "python", "clangd", "go", "python", "rust" }
return {
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({})
            for _, server in pairs(servers) do
                require("plugins.lsp." .. server)
            end
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            {
                "Saecki/crates.nvim",
                dependencies = {
                    "nvim-lua/plenary.nvim", -- Required by crates.nvim
                },
            },
        },
    },
    {
        "p00f/clangd_extensions.nvim",
    },
}
