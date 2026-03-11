-- Important options that need to be set before loading plugins

-- Bind leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Allow more color options
vim.opt.termguicolors = true

-- Load plugins and settings
require "plugin_init"
require "settings"
