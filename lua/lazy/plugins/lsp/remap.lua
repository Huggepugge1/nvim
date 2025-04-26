local remap = require('huggepugge.lib').remap

remap('<leader>f', vim.lsp.buf.format, 'Format the Current Buffer')
