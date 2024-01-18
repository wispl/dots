return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = {"BufReadPost", "BufNewFile"},
		dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"glsl",
				"html",
				"javascript",
				"json",
				"jsonc",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"rust",
				"vim",
			},
			highlight = { enable = true, disable = { latex } },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ik"] = "@block.inner",
						["ak"] = "@block.outer",
						["ia"] = "@parameter.inner",
						["aa"] = "@parameter.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["gs"] = "@parameter.inner",
					},
					swap_previous = {
						["gS"] = "@parameter.inner",
					},
				}
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},
}
