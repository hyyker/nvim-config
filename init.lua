-- Important options that need to be set before loading plugins

-- Bind leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Allow more color options
vim.opt.termguicolors = true

-- Set the background before the colorscheme loads so it picks the right variant
vim.opt.background = "dark"

-- Load plugins, settings and keymaps
require("plugin_init")
require("settings")
require("keymaps")
require("autocmds")
