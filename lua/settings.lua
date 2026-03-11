-- Colors
vim.opt.background = "dark"

-- Try to load gruvbox, but don't crash if it's not installed yet
if not pcall(vim.cmd, "colorscheme gruvbox") then
    vim.cmd("colorscheme default") -- Fallback
end

-- Disable mouse
vim.opt.mouse=""

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Line width
vim.opt.colorcolumn = "80"
vim.opt.wrap = true

-- Line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true


