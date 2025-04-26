local P = {}

function P.remap(keybind, action, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keybind, action, { desc = desc })
end

function P.color(color_scheme)
	color_scheme = color_scheme or 'rose-pine'
	vim.cmd('colorscheme ' .. color_scheme)
end

return P
