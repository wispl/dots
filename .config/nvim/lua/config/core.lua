-- options
vim.o.scrolloff = 4
vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.opt.shortmess:append("W")

vim.o.hidden = true

-- ui stuff
vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.cursorline = true
vim.o.signcolumn = "yes:1"
vim.o.showcmd = false
vim.o.showmode = false
vim.o.list = true
vim.opt.fillchars = { vert = " " }
vim.opt.listchars = {
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
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")

vim.keymap.set("n", "<leadre>tn", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leadre>tc", "<cmd>tcd %:h<cr>")
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>")
vim.keymap.set("n", "[t", "<cmd>tabprev<cr>")

vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)

-- windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<C-Up>", "<C-W>+")
vim.keymap.set("n", "<C-Down>", "<C-W>-")
vim.keymap.set("n", "<C-Left>", "<C-W><")
vim.keymap.set("n", "<C-Right>", "<C-W>>")

vim.keymap.set({ "n", "x" }, "gy", '"+y')

vim.keymap.set("n", "<leader>i", "<cmd>$tabnew ~/notes/index.md | tcd ~/notes<cr>")

-- marking files using arglist, maybe use harpoon or grapple instead
vim.keymap.set(
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
vim.keymap.set(
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
vim.keymap.set("n", "<leader>1", "<cmd>argument 1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>argument 2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>argument 3<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>argument 4<cr>")
