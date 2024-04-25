-- options
local o, opt = vim.o, vim.opt

-- general
o.timeoutlen = 500
o.hidden = true

o.scrolloff = 4
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"

o.wrap = false
o.smartindent = true
o.breakindent = true

o.undofile = true
opt.shortmess:append("WIcC")

o.completeopt = "menuone,noinsert,noselect"

-- searching
o.ignorecase = true
o.smartcase = true
o.infercase = true
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"

-- appearance
o.termguicolors = true

o.laststatus = 3
o.cmdheight = 0
o.showcmd = false
o.showmode = false

o.conceallevel = 2
o.signcolumn = "yes"
o.cursorline = true

o.list = true
opt.fillchars = { vert = " " }
opt.listchars = {
	tab = "  ",
	trail = "·",
	nbsp = "␣",
	precedes = "«",
	extends = "»",
}

-- filetypes
vim.filetype.add({
	extension = {
		vert = "glsl",
		frag = "glsl",
	},
	pattern = {
		[".*/waybar/config"] = "jsonc",
		[".*/mako/config"] = "dosini"
	}
})

-- keymaps
local map = vim.keymap.set

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jk", "<Esc>")

-- toggle options
map("n", "<leader>oz", function() vim.opt_local.spell = not(vim.opt_local.spell:get()) end)
map("n", "<leader>ow", function() vim.opt_local.wrap = not(vim.opt_local.wrap:get()) end)

-- spelling
map("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- diagnostic and quickfix
map("n", "]q", "<cmd>cnext<cr>")
map("n", "[q", "<cmd>cprev<cr>")
map("n", "[d", function() vim.diagnostic.goto_prev() end)
map("n", "]d", function() vim.diagnostic.goto_next() end)

-- tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>")
map("n", "<leader>tc", "<cmd>tcd %:h<cr>")
map("n", "]t", "<cmd>tabnext<cr>")
map("n", "[t", "<cmd>tabprev<cr>")
-- notes tab
map("n", "<leader>i", "<cmd>$tabnew ~/notes/index.md | tcd ~/notes<cr>")

-- windows
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")
-- resize windows
map("n", "<C-Up>", "<C-W>+")
map("n", "<C-Down>", "<C-W>-")
map("n", "<C-Left>", "<C-W><")
map("n", "<C-Right>", "<C-W>>")

-- system clipboard
map({ "n", "x" }, "gy", '"+y')
map("n","gp", '"+p')

-- pair expansions on enter
map("i", "[<Cr>", "[<CR>]<Esc>O")
map("i", "(<Cr>", "(<CR>)<Esc>O")
map("i", "{<Cr>", "{<CR>}<Esc>O")

-- marking files using arglist, maybe use harpoon or grapple instead
map(
	"n",
	"<leader>m",
	function()
		local i = 0
		while i < vim.fn.argc() do
			if (vim.fn.argv(i) == vim.fn.expand("%")) then
				vim.cmd.argdelete("%")
				return
			end
			i = i + 1
		end
		vim.cmd.argadd()
	end
)
map(
	"n",
	"<leader>M",
	function()
		local pickers = require "telescope.pickers"
		local finders = require "telescope.finders"
		local conf = require("telescope.config").values

		local buffers = {}

		local i = 0
		while i < vim.fn.argc() do
			table.insert(buffers, vim.fn.argv(i))
			i = i + 1
		end

		pickers.new({}, {
			prompt_title = "arglist",
			finder = finders.new_table {
				results = buffers
			},
			sorter = conf.generic_sorter(opts),
		}):find()
	end
)
map("n", "<leader>1", "<cmd>argument 1<cr>")
map("n", "<leader>2", "<cmd>argument 2<cr>")
map("n", "<leader>3", "<cmd>argument 3<cr>")
map("n", "<leader>4", "<cmd>argument 4<cr>")
