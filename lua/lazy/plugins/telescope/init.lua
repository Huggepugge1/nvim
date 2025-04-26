return {
	'nvim-telescope/telescope.nvim',
	tag = "0.1.8",
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
	config = function()
		local telescope = require('telescope')

		telescope.setup({
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},
		})

		pcall(telescope.load_extension, 'fzf')
		pcall(telescope.load_extension, 'ui-select')

		require("lazy.plugins.telescope.remap")
	end,
}
