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

	-- Mason (Package Manager for LSPs, formatters, etc.). The servers and
	-- tools it should install are listed in plugins/tools.lua.
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},

	-- Core LSP Configuration. nvim-lspconfig only provides the per-server
	-- defaults (cmd, filetypes, root markers); our overrides live in
	-- after/lsp/<server>.lua and are merged on top (see :help lsp-config).
	-- blink.cmp registers its completion capabilities for every server via
	-- vim.lsp.config("*"), so nothing needs to be passed through here.
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
					end

					-- Neovim ships grn / gra / grr / gri / K / [d / ]d by default,
					-- these only add what's missing or nicer to reach.
					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")

					-- Inlay hints: on by default where supported, with a toggle
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
						map("<leader>ch", function()
							local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
							vim.lsp.inlay_hint.enable(not enabled, { bufnr = ev.buf })
						end, "Toggle inlay hints")
					end
				end,
			})

			-- rust-analyzer comes from rustup, the rest are installed by Mason.
			vim.lsp.enable({ "clangd", "rust_analyzer", "pyright", "ruff", "lua_ls" })
		end,
	},
}
