-- Turn off mouse
vim.opt.mouse = ''

-- Set 4 space indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Lines
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function()
		vim.opt_local.colorcolumn = ''
	end,
})

-- Scrolling
vim.opt.scrolloff = 10

-- Highlight search
vim.opt.hlsearch = true

-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Colors
require("huggepugge.lib").color()
vim.cmd.hi('Comment gui=none')

-- Diagnostics
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		source = 'if_many'
	}
})
vim.opt.signcolumn = 'yes:1'

-- Undo
vim.opt.undofile = true
