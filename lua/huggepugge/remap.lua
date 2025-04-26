local remap = require('huggepugge.lib').remap

-- Show File Exprorer
remap("<leader>pv", vim.cmd.Ex, '[P]roject [View]')

-- Clear highlight
remap('<Esc>', function() vim.cmd('nohlsearch') end, 'Disable Highlight')

-- Copy to Clipboard
remap('<leader>y', '"+y', 'Disable Highlight')

-- Tmux
remap('<C-f>', function() vim.cmd('silent !tmux neww tmux-sessionizer') end, 'Tmux Sessionizer')

-- Diagnostics
remap('<leader>e', vim.diagnostic.open_float, 'Show Diagnostic Messages')
