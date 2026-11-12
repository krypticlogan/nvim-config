-- Edit this file for the active theme, transparency, and color overrides.
-- Install additional theme plugins in lua/plugins/themes.lua.
local M = {}

M.colorscheme = "rose-pine"
M.background = "dark"
M.transparent = true

function M.apply()
	require("rose-pine").setup({
		variant = "auto",
		dark_variant = "main",
		styles = { transparency = M.transparent },
		highlight_groups = {
			Comment = { fg = vim.o.background == "dark" and "#a6da95" or "#B692D5" },
			CursorLine = { bg = "highlight_low" },
		},
	})
	vim.cmd.colorscheme(M.colorscheme)
end

function M.setup()
	local group = vim.api.nvim_create_augroup("UserTheme", { clear = true })
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = group,
		callback = function()
			local hint = vim.api.nvim_get_hl(0, { name = "LspInlayHint", link = false })
			hint.bg = nil
			vim.api.nvim_set_hl(0, "LspInlayHint", hint)
		end,
	})
	vim.o.background = M.background
	M.apply()
end

function M.toggle()
	vim.o.background = vim.o.background == "dark" and "light" or "dark"
	M.apply()
end

return M
