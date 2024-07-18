return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end
			}
		},
		keys = {
			{ "<leader>f", "<cmd>Telescope find_files<cr>" },
			{ "<leader>b", "<cmd>Telescope buffers sort_mru=true<cr>" },
			{ "<leader>g", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>/", "<cmd>Telescope grep_string<cr>" },
			{ "<leader>;", "<cmd>Telescope command_history<cr>" },
			{ "<leader>m", "<cmd>Telescope marks mark_type=global<cr>" },
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				layout_strategy = "flex",
				selection_caret = "  ",
				entry_prefix = "  ",
				dynamic_preview_title = true,
				results_title = "",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55
					},
					width = 0.80,
					height = 0.85
				}
			}
		}
	},
	-- git signs
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		signs = {
	-- 			add = { text = "▎" },
	-- 			change = { text = "▎" },
	-- 			delete = { text = "" },
	-- 			topdelete = { text = "" },
	-- 			changedelete = { text = "▎" },
	-- 			untracked = { text = "▎" },
	-- 		},
	-- 		on_attach = function(buffer)
	-- 			local gs = package.loaded.gitsigns
	--
	-- 			local function map(mode, l, r, desc)
	-- 				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
	-- 			end
	--
	-- 			map("n", "]h", gs.next_hunk, "Next Hunk")
	-- 			map("n", "[h", gs.prev_hunk, "Prev Hunk")
	-- 			map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
	-- 			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
	-- 			map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
	-- 			map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
	-- 			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
	-- 			map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
	-- 			map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
	-- 			map("n", "<leader>hd", gs.diffthis, "Diff This")
	-- 			map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This ~")
	-- 			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
	-- 		end,
	-- 	},
	-- },
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		keys = {
			{
				"<leader>do",
				function()
					require("mini.diff").toggle_overlay(0)
				end,
				desc = "[D]iff [O]verlay",
			},
		},
		opts = {
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
			},
		},
	},
	-- surround
	{
		"echasnovski/mini.surround",
		keys = {
			{ "ys", desc = "Add surrounding" },
			{ "ds", desc = "Delete surrounding" },
			{ "cs", desc = "Replace surrounding" },
			{ "S",
				[[:<C-u>lua MiniSurround.add('visual')<CR>]],
				desc = "Add surrounding (visual)",
				mode = "x",
				silent = true
			},
			{ "yss", "ys_", desc = "Add surrounding to line", remap = true },
		},
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "ys",
					delete = "ds",
					find = "",
					find_left = "",
					highlight = "",
					replace = "cs",
					update_n_lines = "",
				}
			})
			vim.keymap.del("x", "ys")
		end,
	},
	-- text objects
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {
			custom_textobjects = {
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
				d = { "%f[%d]%d+" }, -- digits
				g = function()
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line('$'),
						col = math.max(vim.fn.getline('$'):len(), 1)
					}
					return { from = from, to = to }
				end
			},
		}
	}
}
