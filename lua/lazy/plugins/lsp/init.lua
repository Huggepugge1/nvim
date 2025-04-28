return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'folke/lazydev.nvim',
				ft = 'lua',
				opts = {
					library = {
						{ path = '${3rd}/luv/library', words = { 'vim%.uv' } }
					},
				},
			},
			{
				'williamboman/mason.nvim',
				config = true,
			},
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			'saghen/blink.cmp',
		},
		config = function()
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
				local capabilities = require('blink.cmp').get_lsp_capabilities()
				local servers = {
					lua_ls = {
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
									library = {
										'${3rd}/ruv/library',
										unpack(vim.api.nvim_get_runtime_file('', true)),
									},
								},
								completion = {
									callSnippet = 'Replace'
								}
							}
						},
						capabilities = {},
					},
					rust_analyzer = {
						settings = {
							['rust-analyzer'] = {
								checkOnSave = {
									command = 'clippy'
								},
							},
						},
						capabilities = {},
					},
					clangd = {
						settings = {},
						capabilities = {},
					},
					omnisharp = {
						root_dir = require("lspconfig.util").root_pattern("Packages", "ProjectSettings", ".git"),
						cmd = {
							vim.fn.stdpath("data") .. "/mason/bin/omnisharp",
							"--languageserver",
							"--hostPID",
							tostring(vim.fn.getpid()),
						},
						settings = {},
						capabilities = {},
					}
				}

				require('mason-tool-installer').setup({ ensure_installed = vim.tbl_keys(servers) })

				require('mason-lspconfig').setup({
					automatic_installation = false,
					handlers = {
						function(server_name)
							local server = servers[server_name] or {}
							server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities)
							require('lspconfig')[server_name].setup(server)
						end,
					},
				})

			require('lazy.plugins.lsp.remap')
		end,
	},
}
