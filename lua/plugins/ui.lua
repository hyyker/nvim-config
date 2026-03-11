return {
	-- Color Schemes
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "folke/tokyonight.nvim" },
	{ "catppuccin/nvim" },
	{ "sainnhe/everforest" },
	{ "bettervim/yugen.nvim" },
	{ "olivercederborg/poimandres.nvim" },

	-- Colorize hex codes
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},

	-- Which-Key (Keybind helper menu)
	{
		"folke/which-key.nvim",
		lazy = false,
		config = function()
			require("which-key").setup()
		end,
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "   Recent", ":Telescope oldfiles <CR>"),
				dashboard.button("f", "󰍉  > Find file", ":Telescope find_files <CR>"),
				dashboard.button("g", "󰛓  > Find word", ":Telescope live_grep <CR>"),
				dashboard.button("c", "  > Select color palette", ":Telescope colorscheme <CR>"),
				dashboard.button("l", "  > Open Lazy", ":Lazy <CR>"),
				dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
			}
			dashboard.section.footer.val = { "Be silly :3" }

			alpha.setup(dashboard.opts)
		end,
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
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				globalstatus = false,
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
