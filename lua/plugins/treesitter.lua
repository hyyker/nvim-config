return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "lua", "nix", "rust", "python", "bash" },
				-- LaTeX is removed entirely
				highlight = { enable = true },
			})
		end,
	},
}
