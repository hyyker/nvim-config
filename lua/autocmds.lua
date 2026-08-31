-- Briefly highlight text when it's yanked
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Return to the last cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("LastCursorPosition", {}),
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
