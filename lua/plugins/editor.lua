return {
	-- Plenary (Required dependency for Telescope, Remote-Nvim, etc.)
	{ "nvim-lua/plenary.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
		},
	},

	-- GitHub Copilot
	{ "github/copilot.vim" },

	-- Git Signs (Gutter markers for Git changes)
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Autopairs (Automatically close brackets)
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},

	-- Highlight trailing whitespace
	{
		"ntpeters/vim-better-whitespace",
		config = function()
			vim.g.better_whitespace_enabled = 1
		end,
	},

	-- Remote Neovim (DevContainers / SSH)
	{
		"amitds1997/remote-nvim.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
}
