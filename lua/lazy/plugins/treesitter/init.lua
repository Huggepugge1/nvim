return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require('nvim-treesitter.install').update({ with_sync = true })()
    end,
    config = function()
	require('nvim-treesitter.configs').setup({
	  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline', 'rust' },

	  sync_install = false,
	  -- If parser not avail for buffer, install
	  auto_install = true,

	  parser_install_dir = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter',

	  highlight = {
	    enable = true,
	    additional_vim_regex_highlighting = false,
	  }
	})
    end,
}
