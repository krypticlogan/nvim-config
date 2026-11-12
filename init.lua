-- Keep startup order here; edit the focused modules below for behavior.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.options")
require("config.autocmds")
require("config.diagnostics")
require("config.lazy")
require("config.keymaps")
