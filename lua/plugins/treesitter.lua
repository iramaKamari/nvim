return {
  --{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "mfussenegger/nvim-treehopper",
    keys = { { "m", mode = { "o", "x" } } },
    config = function()
      vim.cmd([[
	omap <silent> m :<C-U>lua require("tsht").nodes()<CR>
        xnoremap <silent> m :lua require("tsht").nodes()<CR>
      ]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup(
      {
	highlight = { enable = true },
	indent = { enable = true },
	--context_commentstring = { enable = true, enable_autocmd = false },
	auto_install = true,
	  query_linter = {
	    enable = true,
	    use_virtual_text = true,
	    lint_events = { "BufWrite", "CursorHold" },
	  },
	  ensure_installed = {
	    "bash",
	    "c",
	    "cmake",
	    -- "comment", -- comments are slowing down TS bigtime, so disable for now
	    "cpp",
	    "css",
	    "diff",
	    "fish",
	    "gitignore",
	    "go",
	    "graphql",
	    "help",
	    "html",
	    "http",
	    "java",
	    "javascript",
	    "jsdoc",
	    "json",
	    "jsonc",
	    "julia",
	    "latex",
	    "lua",
	    "markdown",
	    "markdown_inline",
	    "meson",
	    "ninja",
	    "nix",
	    "norg",
	    "org",
	    "php",
	    "python",
	    "query",
	    "regex",
	    "rust",
	    "scss",
	    "sql",
	    "svelte",
	    "teal",
	    "toml",
	    "tsx",
	    "typescript",
	    "vhs",
	    "vim",
	    "vue",
	    "wgsl",
	    "yaml",
	    -- "wgsl",
	  },
	  --playground = {
	  --  enable = true,
	  --  disable = {},
	  --  updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	  --  persist_queries = true, -- Whether the query persists across vim sessions
	  --  keybindings = {
	  --    toggle_query_editor = "o",
	  --    toggle_hl_groups = "i",
	  --    toggle_injected_languages = "t",
	  --    toggle_anonymous_nodes = "a",
	  --    toggle_language_display = "I",
	  --    focus_language = "f",
	  --    unfocus_language = "F",
	  --    update = "R",
	  --    goto_node = "<cr>",
	  --    show_help = "?",
	  --  },
	  --},
	})
    end,
  },
}
