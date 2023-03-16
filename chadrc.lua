---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
-- require("custom.lsp")

M.ui = {
	theme_toggle = { "tokyonight", "catppuccin" },
	theme = "tokyonight",
	transparency = true,
	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
