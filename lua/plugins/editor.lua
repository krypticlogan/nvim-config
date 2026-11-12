return {
	{
		"nvim-mini/mini.nvim",
		version = false,
		config = function()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
			require("mini.statusline").setup()
			require("mini.tabline").setup()
			require("mini.pick").setup()
			require("mini.extra").setup()
			require("mini.completion").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
			require("mini.diff").setup()
			require("mini.indentscope").setup({
				draw = { delay = 150, animation = require("mini.indentscope").gen_animation.none() },
			})
		end,
	},
}
