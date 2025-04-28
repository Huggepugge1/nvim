local remap = require('huggepugge.lib').remap

-- Show File Exprorer
remap("<leader>pv", vim.cmd.Ex, '[P]roject [View]')

-- Clear highlight
remap('<Esc>', function() vim.cmd('nohlsearch') end, 'Disable Highlight')

-- Tmux
remap('<C-f>', function() vim.cmd('silent !tmux neww tmux-sessionizer') end, 'Tmux Sessionizer')

-- Diagnostics
remap('<leader>e', vim.diagnostic.open_float, 'Show Diagnostic Messages')

-- Competitive Programming
remap(
	'<leader>cct',
	function()
		local file_to_copy = '/home/huggepugge/codeforces/template'
		local netrw_dir = vim.b.netrw_curdir
		if not netrw_dir then
			print('Not in a directory')
			return
		end

		local problem = vim.fn.input('Enter problem name: ')
		if not problem or problem == '' then return end
		local destination = netrw_dir .. '/' .. problem

		print('Creating ' .. destination)

		local result = vim.system({ 'cp', '-r', file_to_copy, destination }):wait()
		if result.stderr ~= '' then print(result.stderr) end

		vim.b.netrw_curdir = destination
		vim.cmd('edit' .. destination)
	end,
	'[C]opy the [C]++ [T]emplate to Current Directory'
)
