local group = vim.api.nvim_create_augroup("UserEditing", { clear = true })
-- Use available system parsers without downloading another Tree-sitter installation.
vim.api.nvim_create_autocmd("FileType", {
	group = group,
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})
