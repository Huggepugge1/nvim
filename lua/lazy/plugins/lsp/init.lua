return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					{ path = '${3rd}/luv/library', words = { 'vim%.uv' } }
				}
			},
			{
				'williamboman/mason.nvim',
				config = true,
			},
			'williamboman/mason-lspconfig.nvim'
		},
		config = function()
			require('lspconfig').lua_ls.setup({})
			require('lspconfig').rust_analyzer.setup({
				settings = {
					['rust-analyzer'] = {
						checkOnSave = {
							command = 'clippy'
						},
					},
				},
			})
			require('lspconfig').clangd.setup({})
			require('lspconfig').omnisharp.setup({
				root_dir = require("lspconfig.util").root_pattern("Packages", "ProjectSettings", ".git"),
				cmd = {
					vim.fn.stdpath("data") .. "/mason/bin/omnisharp",
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				}
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
					if not client then return end

					-- Format the current buffer on save
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
						end,
					})
				end,
			})
		end,
	},
}
