local remap = require("huggepugge.lib").remap

local builtin = require("telescope.builtin")

-- Files
remap("<leader>sf", builtin.find_files, '[S]earch [F]iles')
remap("<leader>sg", builtin.git_files, '[S]earch [G]it Files')

-- Diagnonstics
remap("<leader>sd", builtin.diagnostics, '[S]earch [D]iagnonstics')

-- Keymaps
remap("<leader>sk", builtin.keymaps, '[S]earch [K]eymaps')
