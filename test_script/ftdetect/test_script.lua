vim.filetype.add({
	extension = {
		tesc = "TestScript",
	},
})

-- Alternative method using autocmd if you prefer:
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.tesc",
	command = "set filetype=TestScript",
})
