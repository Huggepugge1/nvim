local remap = require('huggepugge.lib').remap

remap(
	'<leader>rm',
	function()
		require('monocle').reload()
		package.loaded.monocle = nil
		require('monocle').setup()
	end
)
