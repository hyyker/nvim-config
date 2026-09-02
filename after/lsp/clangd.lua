-- clangd logs every request to stderr at info level by default, and Neovim
-- records server stderr in lsp.log as ERROR. This keeps the log usable.
return {
	cmd = { "clangd", "--log=error" },
}
