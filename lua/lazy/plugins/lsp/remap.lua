local remap = require('huggepugge.lib').remap
local builtin = require('telescope.builtin')

-- Format
remap('<leader>f', vim.lsp.buf.format, 'Format the Current Buffer')

-- Goto
remap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
remap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
remap('grr', builtin.lsp_references, '[G]oto [R]eferences')
remap('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')
remap('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')

-- Search Symbols
remap('gs', builtin.lsp_document_symbols, 'Search For Document [Symbols]')
remap('gws', builtin.lsp_dynamic_workspace_symbols, 'Search For [W]orkspace [Symbols]')

-- Code Actions
remap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'v' })

-- Rename
remap('grn', vim.lsp.buf.rename, '[R]e[N]ame')
