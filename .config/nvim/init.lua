vim.loader.enable()

-- initialization
require("config.options")
-- lazy load shada
local shada = vim.o.shada
vim.o.shada = ""
-- lazy load clipboard
local clipboard = vim.opt.clipboard
vim.opt.clipboard = ""
-- lazy load autocmds if not opening a file
local lazy_autocmds = vim.fn.argc(-1) == 0
if not lazy_autocmds then
	require("config.autocmds")
end

-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- install plugins
require("lazy").setup("plugins", {
	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"rplugin",
				"zipPlugin",
			},
		}
	},
})

--- source rest of configs
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("SourceConfig", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		if lazy_autocmds then
			require("config.autocmds")
		end
		require("config.keymaps")
		require("config.modeline")

		vim.o.shada = shada
		pcall(vim.cmd.rshada, { bang = true })

		vim.opt.clipboard = clipboard
	end
})
vim.cmd.colorscheme("kanagawa")
