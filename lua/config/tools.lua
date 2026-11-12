-- Install missing tools explicitly with :SetupTools; preserve system Rust/Zig versions.
vim.api.nvim_create_user_command("SetupTools", function()
	local registry = require("mason-registry")
	registry.refresh(function()
		for _, name in ipairs({
			"lua-language-server",
			"basedpyright",
			"ruff",
			"typescript-language-server",
			"json-lsp",
			"bash-language-server",
			"texlab",
			"stylua",
			"prettier",
		}) do
			local ok, pkg = pcall(registry.get_package, name)
			if ok and not pkg:is_installed() and not pkg:is_installing() then
				pkg:install()
			end
		end
	end)
end, { desc = "Install language servers and formatters through Mason" })
