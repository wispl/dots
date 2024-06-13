local o, opt = vim.o, vim.opt

-- general
o.timeoutlen = 500
o.mouse = "a"
o.hidden = true
o.smoothscroll = true

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

-- ui
o.laststatus = 3
o.cmdheight = 0
o.showcmd = false
o.showmode = false

o.conceallevel = 2
o.signcolumn = "yes:1"
o.cursorline = true
o.list = true
opt.fillchars = {
	vert = " ",
	foldclose = "",
	foldopen = "",
	fold = " "
}
opt.listchars = {
	tab = "  ",
	trail = "·",
	nbsp = "␣",
	precedes = "«",
	extends = "»",
}

-- folds
o.foldmethod = "indent"
o.foldlevel = 99
o.foldtext = ""
vim.g.markdown_folding = 1

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
