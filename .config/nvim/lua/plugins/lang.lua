return {
	-- project configuration
	{
		"tpope/vim-projectionist",
		lazy = false,
		keys = {
			{ "<leader>a", "<cmd>A<cr>", desc = "[A]lt file" }
		},
		init = function()
			vim.g.projectionist_heuristics = {
				-- Make and cmake
				["build/Makefile"] = {
					["*"] = {
						make = "make -Ck build",
						dispatch = "./build/{project|basename}"
					}
				},
				-- Headers and source files for cpp and c
				["src/*.c|*.c|src/*.cpp|*.cpp"] = {
					["*.cpp"] = {
						alternate = { "{}.h", "{}.hpp" }
					},
					["*.c"] = {
						alternate = "{}.h"
					},
					["*.h"]   = {
						alternate = { "{}.c", "{}.cpp" }
					},
					["*.hpp"]   = {
						alternate = "{}.cpp"
					}
				},	
				-- rust
				["Cargo.toml"] = {
					["*"] = {
						make = "cargo build",
						dispatch = "cargo run"
					}
				}
			}
		end,
	},
	-- async commmands for building and running
	{
		"tpope/vim-dispatch",
		cmd = { "Dispatch", "Make", "Start" },
		keys = {
			{ "<leader>cc", "<cmd>Make<cr>", desc = "[C]ode [C]ompile" },
			{ "<leader>rr", "<cmd>Dispatch<cr>", desc = "[R]un [R]un" }
		},
		init = function()
			vim.g.dispatch_no_maps = 1
		end
	},
	-- latex
	{
		"lervag/vimtex",
		lazy = false, -- lazy-loading will disable inverse search
		config = function()
			vim.api.nvim_create_autocmd({ "FileType" }, {
				group = vim.api.nvim_create_augroup("Vimtex Conceal", {}),
				pattern = { "bib", "tex" },
				callback = function() vim.wo.conceallevel = 2 end,
			})
			vim.g.vimtex_view_method = "zathura"
		end,
	}
}
