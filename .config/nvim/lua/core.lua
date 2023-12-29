-- options
vim.o.scrolloff = 4
vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true

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
		frag = "glsl"
	}
})

-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>")
vim.keymap.set("n", "[t", "<cmd>tabprev<cr>")
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)

vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.keymap.set("n", "<leader>i", "<cmd>$tabnew ~/notes/index.md<cr><cmd>tcd ~/notes<cr>")
