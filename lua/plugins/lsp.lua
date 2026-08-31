return {
	-- Lua LS support for editing this config (types for vim.*, lazy, etc.)
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

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
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "clangd", "rust_analyzer", "pyright", "ruff", "lua_ls" },
			-- Servers are enabled explicitly below via vim.lsp.enable(), so each
			-- one keeps its custom settings instead of being auto-enabled bare.
			automatic_enable = false,
		},
	},

	-- Core LSP Configuration
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Global LspAttach Autocommand
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- Enable Inlay Hints if supported
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
					end

					-- Keymaps (Buffer local)
					local opts = { buffer = ev.buf, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, opts)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, opts)
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
						checkOnSave = true,
						check = { command = "clippy" },
					},
				},
			}
			vim.lsp.enable("rust_analyzer")

			-- pyright for types, ruff for lint + import organisation.
			vim.lsp.config.pyright = {
				capabilities = capabilities,
				settings = {
					pyright = { disableOrganizeImports = true }, -- ruff owns this
				},
			}
			vim.lsp.enable("pyright")

			vim.lsp.config.ruff = {
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false -- let pyright hover
				end,
			}
			vim.lsp.enable("ruff")

			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						telemetry = { enable = false },
					},
				},
			}
			vim.lsp.enable("lua_ls")
		end,
	},
}
