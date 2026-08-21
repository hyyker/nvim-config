return {
	-- Mason (Package Manager for LSPs, formatters, etc.)
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config bridge
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = { "clangd", "rust_analyzer", "pyright", "lua_ls" },
			-- Servers are enabled explicitly below via vim.lsp.enable(), so each
			-- one keeps its custom settings instead of being auto-enabled bare.
			automatic_enable = false,
		},
	},

	-- Core LSP Configuration
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Global LspAttach Autocommand
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- Enable Inlay Hints if supported
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end

					-- Keymaps (Buffer local)
					local opts = { buffer = ev.buf, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				end,
			})

			-- Configure Servers
			vim.lsp.config.clangd = { capabilities = capabilities }
			vim.lsp.enable("clangd")

			vim.lsp.config.rust_analyzer = {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						imports = { granularity = { group = "module" }, prefix = "self" },
						cargo = { buildScripts = { enable = true } },
						procMacro = { enable = true },
						checkOnSave = { command = "clippy" },
					},
				},
			}
			vim.lsp.enable("rust_analyzer")

			vim.lsp.config.pyright = { capabilities = capabilities }
			vim.lsp.enable("pyright")

			vim.lsp.config.lua_ls = { capabilities = capabilities }
			vim.lsp.enable("lua_ls")
		end,
	},
}
