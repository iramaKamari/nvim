local has_words_before = function()
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"ray-x/cmp-treesitter",
			"p00f/clangd_extensions.nvim",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				completion = {
					keyword_length = 2,
					completeopt = "menu,menuone,noselect,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-s>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
							--elseif luasnip.jumpable(-1) then
							--    luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-l>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							return cmp.complete_common_string()
						end
						fallback()
					end, { "i", "c" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				--formatting = {
				--  format = function(_, item)
				--    local icons = require("lazyvim.config").icons.kinds
				--    if icons[item.kind] then
				--      item.kind = icons[item.kind] .. item.kind
				--    end
				--    return item
				--  end,
				--},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						require("lspkind").cmp_format({
							mode = "text",
							menu = ({
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								treesitter = "[Tree]",
								path = "[Path]",
								crates = "[Crates]",
								luasnip = "[LuaSnip]",
								nvim_lua = "[Lua]",
								latex_symbols = "[Latex]",
							}),
							maxwidth = 35
						})(entry, vim_item)
						vim_item.abbr = vim_item.abbr:match("[^(]+")
						return vim_item
					end,
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.recently_used,
						require("clangd_extensions.cmp_scores"),
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				experimental = {
					ghost_text = {
						hl_group = "Comment",
					},
				},
			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			require("cmp").setup(opts)
			-- Set configuration for specific filetype.
			require("cmp").setup.filetype("gitcommit", {
				sources = require("cmp").config.sources({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = "buffer" },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
			require("cmp").setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				},
				view = {
					entries = { name = "wildmenu", separator = "|" }
				},
			})

			-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
			require("cmp").setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{ name = "cmdline" }
				})
			})
		end,
	},

	-- auto pairs
	--{
	--  "echasnovski/mini.pairs",
	--  event = "VeryLazy",
	--  config = function(_, opts)
	--    require("mini.pairs").setup(opts)
	--  end,
	--},

	-- surround
	{
		"echasnovski/mini.surround",
		--keys = function(plugin, keys)
		--  -- Populate the keys based on the user"s options
		--  local opts = require("lazy.core.plugin").values(plugin, "opts", false)
		--  local mappings = {
		--    { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
		--    { opts.mappings.delete, desc = "Delete surrounding" },
		--    { opts.mappings.find, desc = "Find right surrounding" },
		--    { opts.mappings.find_left, desc = "Find left surrounding" },
		--    { opts.mappings.highlight, desc = "Highlight surrounding" },
		--    { opts.mappings.replace, desc = "Replace surrounding" },
		--    { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
		--  }
		--  return vim.list_extend(mappings, keys)
		--end,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
		config = function(_, opts)
			-- use gz mappings instead of s to prevent conflict with leap
			require("mini.surround").setup(opts)
		end,
	},

	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},

	-- better text-objects
	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "x", "o" } },
			{ "i", mode = { "x", "o" } },
		},
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = false,
			},
		},
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			}
		end,
		config = function(_, opts)
			local ai = require("mini.ai")
			ai.setup(opts)
		end,
	},
}
