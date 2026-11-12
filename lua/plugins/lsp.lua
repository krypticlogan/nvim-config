return {
	{ "mason-org/mason.nvim", opts = { PATH = "append" } },
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("config.lsp")
			require("config.tools")
		end,
	},
}
