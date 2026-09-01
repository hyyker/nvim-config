return {
	-- Color Schemes
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{ "folke/tokyonight.nvim", lazy = true },
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "bettervim/yugen.nvim", lazy = true },
	{ "olivercederborg/poimandres.nvim", lazy = true },

	-- Colorize hex codes (maintained fork; norcalli's is abandoned and
	-- still calls the removed vim.tbl_flatten)
	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},

	-- Which-Key (Keybind helper menu)
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Dashboard, indent guides and misc QoL (replaces alpha-nvim + indent-blankline)
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			quickfile = { enabled = true },
			indent = { enabled = true },
			dashboard = {
				preset = {
					header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
					-- Icons as \u{} escapes so the bytes can't get mangled on save.
					-- All are in the FontAwesome PUA range that every Nerd Font ships.
					keys = {
						{ icon = "\u{f067} ", key = "e", desc = "New File", action = ":ene | startinsert" },
						{ icon = "\u{f1da} ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
						{ icon = "\u{f002} ", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = "\u{f15c} ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
						{ icon = "\u{f1fc} ", key = "c", desc = "Colorschemes", action = ":Telescope colorscheme" },
						{ icon = "\u{f0e7} ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = "\u{f011} ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
					{ text = "Be silly :3", align = "center", padding = 1 },
				},
			},
		},
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
}
