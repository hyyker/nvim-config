return {
	-- Auto-installer for CLI tools (formatters / linters not managed as LSPs)
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"clang-format",
			},
			auto_update = false,
			run_on_start = true,
		},
	},

	-- Conform for formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_format" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}
