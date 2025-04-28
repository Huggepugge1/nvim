local M = {}

local syntax = vim.api.nvim_create_namespace("test_script")

vim.api.nvim_command("syntax clear")

-- Keywords
vim.api.nvim_command("syntax keyword test_scriptKeyword let const for in")

-- String
vim.api.nvim_command('syntax region test_scriptString start=/"/ end=/"/ contains=test_scriptEscape')

-- Numbers
vim.api.nvim_command("syntax match test_scriptNumber /\\d\\+/")

-- Comments
vim.api.nvim_command("syntax match test_scriptComment /\\/.*$/")

-- Operators
vim.api.nvim_command("syntax match test_scriptOperator /[+\\-*\\/=]\\+/")

-- Link groups to highlight groups
vim.api.nvim_command("highlight default link test_scriptKeyword Keyword")
vim.api.nvim_command("highlight default link test_scriptString String")
vim.api.nvim_command("highlight default link test_scriptNumber Number")
vim.api.nvim_command("highlight default link test_scriptComment Comment")
vim.api.nvim_command("highlight default link test_scriptOperator Operator")

return M
