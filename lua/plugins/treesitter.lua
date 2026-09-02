-- The `main` branch: parsers are compiled locally, so it needs the
-- `tree-sitter` CLI (brew install tree-sitter) and a C compiler on PATH.
-- Unlike `master`, the plugin no longer enables anything itself; highlighting,
-- indentation and folds are wired up per buffer in the FileType autocmd below.
--
-- Parsers Neovim already bundles (c, lua, vim, vimdoc, query, markdown,
-- markdown_inline) are not listed: Neovim's own copies are used for those.
-- (`cpp` depends on `c`, so the plugin installs its own `c` regardless.)
local parsers = {
	"bash",
	"cpp",
	"diff",
	"gitcommit",
	"json",
	"luadoc",
	"python",
	"rust",
	"toml",
	"yaml",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false, -- the main branch does not support lazy-loading
		config = function()
			-- Installs into stdpath("data")/site (prepended to rtp). No-op if
			-- everything is already present; runs asynchronously otherwise.
			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("UserTreesitter", {}),
				callback = function(args)
					-- Skip buffers without a parser instead of erroring
					if not pcall(vim.treesitter.start, args.buf) then
						return
					end
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
