-- Inline errors and warnings refresh while typing.
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
	severity_sort = true,
	float = { border = "rounded" },
})
