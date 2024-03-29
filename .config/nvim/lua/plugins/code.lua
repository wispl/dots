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
			ls.setup({
				enable_autosnippets = true,
			})

			vim.api.nvim_create_autocmd({ "ModeChanged" }, {
				group = vim.api.nvim_create_augroup("LuaSnip Session Cancel", {}),
				pattern = "*",
				callback = function()
					if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
						and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
						and not require('luasnip').session.jump_active
					then
						require('luasnip').unlink_current()
					end
				end
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
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					}
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = string.format("     (%s) ", vim_item.kind)
						return vim_item
					end,
				},
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
