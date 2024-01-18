return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		keys = {
			{ "<tab>",
				function()
					return require("luasnip").expand_or_jumpable()
						and "<Plug>luasnip-expand-or-jump"
						or "<tab>"
				end,
				expr = true, silent = true, mode = "i",
			},
			{ "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
			{ "<S-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
		},
		config = function()
			require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/snippets/" })
			ls = require("luasnip")
			ls.filetype_extend("glsl", {"c"})
			ls.filetype_extend("cpp", {"c"})
			require("luasnip").setup({
				enable_autosnippets = true,
				history = true,
			})
		end
	},
	-- autocompletion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp"
		},
		opts = function()
			local cmp = require("cmp")
			return {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				}),
				experimental = { ghost_text = true }
			}
		end,
	}
}
