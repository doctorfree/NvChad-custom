---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

-- nvdash (dashboard)
M.nvdash = {
	load_on_startup = true,

	header = {
		"           ▄ ▄                   ",
		"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
		"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
		"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
		"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
		"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
		"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
		"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
		"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
	},

	buttons = {
		{ "  Find File", "Spc f f", "Telescope find_files" },
		{ "  Recent Files", "Spc f o", "Telescope oldfiles" },
		{ "  Find Word", "Spc f w", "Telescope live_grep" },
		{ "  Bookmarks", "Spc b m", "Telescope marks" },
		{ "  Themes", "Spc t h", "Telescope themes" },
		{ "  Mappings", "Spc c h", "NvCheatsheet" },
	},
}

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
