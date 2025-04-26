local remap = require('huggepugge.lib').remap

local harpoon = require('harpoon')
local list = harpoon:list()

remap("<leader>a", function() list:add() end, '[A]dd to harpoon')
remap("<C-e>", function() harpoon.ui:toggle_quick_menu(list) end, 'Toggle Quick Menu')

remap("<C-h>", function() list:select(1) end, 'Select Harpoon Window 1')
remap("<C-t>", function() list:select(2) end, 'Select Harpoon Window 2')
remap("<C-n>", function() list:select(3) end, 'Select Harpoon Window 3')
remap("<C-s>", function() list:select(4) end, 'Select Harpoon Window 4')
