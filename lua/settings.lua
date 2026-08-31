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

-- Single global statusline (lualine renders it)
vim.opt.laststatus = 3

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

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
