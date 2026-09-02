-- Leader (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set the background before the colorscheme loads so it picks the right variant
vim.opt.background = "dark"

-- Disable mouse
vim.opt.mouse = ""

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Line width
vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.linebreak = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep the sign column always visible so the buffer doesn't jump around
-- when diagnostics / git signs appear
vim.opt.signcolumn = "yes"

-- Single global statusline (lualine renders it, including the mode)
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Show trailing whitespace and non-breaking spaces; keep tabs invisible
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits open where you'd expect
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep some context around the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Persistent undo
vim.opt.undofile = true

-- Faster CursorHold / gitsigns updates, snappier which-key
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

-- Confirm instead of erroring on unsaved changes
vim.opt.confirm = true

-- Diagnostics: inline text is off by default since 0.11, turn it back on
vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = { border = "rounded" },
})
