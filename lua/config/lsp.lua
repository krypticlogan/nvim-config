local configs = {
	rust_analyzer = {},
	zls = {},
	basedpyright = {},
	ruff = {},
	clangd = {},
	ts_ls = {},
	jsonls = {},
	bashls = {},
	lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } }, telemetry = { enable = false } } } },
	texlab = {},
}
for name, config in pairs(configs) do
	vim.lsp.config(name, config)
	vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
		local function map(key, fn, desc)
			vim.keymap.set("n", key, fn, { buffer = args.buf, desc = desc })
		end
		map("gd", vim.lsp.buf.definition, "Go to definition")
		map("gr", vim.lsp.buf.references, "References")
		map("gI", vim.lsp.buf.implementation, "Implementation")
		map("K", vim.lsp.buf.hover, "Documentation")
		map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map("<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("<leader>uh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
		end, "Toggle inlay hints")
	end,
})
