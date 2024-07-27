vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- from LazyVim, tries to render a file as quickly as possible when first
-- opening from cmdline, colors may flicker but it is better than flickering
-- from the text
vim.api.nvim_create_autocmd("BufReadPost", {
	once = true,
	callback = function(event)
		-- Skip if we already entered vim
		if vim.v.vim_did_enter == 1 then
			return
		end

		-- Try to guess the filetype (may change later on during Neovim startup)
		local ft = vim.filetype.match({ buf = event.buf })
		if ft then
			-- Add treesitter highlights and fallback to syntax
			local lang = vim.treesitter.language.get_lang(ft)
			if not (lang and pcall(vim.treesitter.start, event.buf, lang)) then
				vim.bo[event.buf].syntax = ft
			end

			-- Trigger early redraw
			vim.cmd.redraw()
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true} ),
	pattern = {
		"help",
		"notify",
		"qf",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", {
			buffer = event.buf,
			silent = true,
			desc = "Quit buffer",
		})
	end,
})
