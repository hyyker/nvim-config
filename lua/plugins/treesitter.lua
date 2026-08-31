return {
	-- Still on the `master` branch deliberately: the `main` rewrite requires the
	-- standalone `tree-sitter` CLI on PATH to compile every parser, which isn't
	-- worth the friction yet. Revisit once `main` stabilises.
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"luadoc",
					"nix",
					"rust",
					"python",
					"bash",
					"markdown",
					"markdown_inline",
					"json",
					"yaml",
					"toml",
					"vim",
					"vimdoc",
					"query",
					"gitcommit",
					"diff",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
