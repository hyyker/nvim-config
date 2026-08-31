return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
		},
	},

	--	-- GitHub Copilot
	--	{
	--		"zbirenbaum/copilot.lua",
	--		event = "InsertEnter",
	--		cmd = "Copilot",
	--		config = true,
	--	},

	-- Git Signs (Gutter markers for Git changes)
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- Autopairs (Automatically close brackets)
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Highlight trailing whitespace
	{
		"ntpeters/vim-better-whitespace",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			vim.g.better_whitespace_enabled = 1
			vim.g.strip_whitespace_on_save = 0
		end,
	},
}
