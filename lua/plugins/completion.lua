return {
	-- Completion (blink.cmp — replaces nvim-cmp + the cmp-* / LuaSnip stack)
	{
		"saghen/blink.cmp",
		version = "1.*", -- tagged release ships a prebuilt fuzzy-matcher binary
		-- Not lazy-loaded: blink registers its LSP capabilities for every server
		-- via vim.lsp.config("*") when it loads, and that must happen before the
		-- first language server starts (blink defers its own heavy work anyway).
		lazy = false,
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "hide" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind", gap = 1 },
						},
					},
				},
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "lazydev", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- outrank LSP for lua config editing
					},
				},
			},
		},
	},
}
