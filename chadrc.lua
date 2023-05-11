---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
	theme_toggle = { "tokyonight", "catppuccin" },
	theme = "catppuccin",
	transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true, -- adds highlight groups for lsp semantic tokens
  telescope = { style = "bordered" }, -- borderless / bordered
  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {"notify"}, -- these aren't compiled by default, ex: "alpha", "notify"

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    },
--  header = {
--    "           ▄ ▄                   ",
--    "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
--    "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
--    "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
--    "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
--    "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
--    "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
--    "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
--    "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
--  },
--  header = {
--    "     dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb ",
--    "    dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP ",
--    "   dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP  ",
--    "  dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP   ",
--    " dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP    ",
--  },
--  header = {
--    "      __                _            ",
--    "   /\\ \\ \\___  ___/\\   /(_)_ __ ___   ",
--    "  /  \\/ / _ \\/ _ \\ \\ / | | '_ ` _ \\  ",
--    " / /\\  |  __| (_) \\ V /| | | | | | | ",
--    " \\_\\ \\/ \\___|\\___/ \\_/ |_|_| |_| |_| ",
--  },
--  header = {
--    " _   _        ____ _               _ ",
--    "| \\ | |_   __/ ___| |__   __ _  __| |",
--    "|  \\| \\ \\ / / |   | '_ \\ / _` |/ _` |",
--    "| |\\  |\\ V /| |___| | | | (_| | (_| |",
--    "|_| \\_| \\_/  \\____|_| |_|\\__,_|\\__,_|",
--  },
--  header = {
--    " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--    " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--    " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--    " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--    " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--  },
--  header = {
--    " _  _        ___  _              _ ",
--    "| \\| |__ __ / __|| |_   __ _  __| |",
--    "| .` |\\ V /| (__ | ' \\ / _` |/ _` |",
--    "|_|\\_| \\_/  \\___||_||_|\\__,_|\\__,_|",
--  },
--  header = {
--    "      _/      _/                _/_/_/  _/                        _/   ",
--    "     _/_/    _/  _/      _/  _/        _/_/_/      _/_/_/    _/_/_/    ",
--    "    _/  _/  _/  _/      _/  _/        _/    _/  _/    _/  _/    _/     ",
--    "   _/    _/_/    _/  _/    _/        _/    _/  _/    _/  _/    _/      ",
--    "  _/      _/      _/        _/_/_/  _/    _/    _/_/_/    _/_/_/       ",
--  },
--  header = {
--    "    _   __        ______ __                __",
--    "   / | / /_   __ / ____// /_   ____ _ ____/ /",
--    "  /  |/ /| | / // /    / __ \\ / __ `// __  / ",
--    " / /|  / | |/ // /___ / / / // /_/ // /_/ /  ",
--    "/_/ |_/  |___/ \\____//_/ /_/ \\__,_/ \\__,_/   ",
--  },
--  header = {
--    " \\  |           ___|  |                 | ",
--    "  \\ | \\ \\   /  |      __ \\    _` |   _` | ",
--    "|\\  |  \\ \\ /   |      | | |  (   |  (   | ",
--    "| \\_|   \\_/   \\____| _| |_| \\__,_| \\__,_| ",
--  },
--  header = {
--    "   , _           ___  _                 ",
--    "  /|/ \\         / (_)| |             |  ",
--    "   |   |       |     | |     __,   __|  ",
--    "   |   |  |  |_|     |/ \\   /  |  /  |  ",
--    "   |   |_/ \\/   \\___/|   |_/\\_/|_/\\_/|_/",
--  },
--  header = {
--    " _   _          ____  _                 _ ",
--    "| \\ | |__   __ / ___|| |__    __ _   __| |",
--    "|  \\| |\\ \\ / /| |    | '_ \\  / _` | / _` |",
--    "| |\\  | \\ V / | |___ | | | || (_| || (_| |",
--    "|_| \\_|  \\_/   \\____||_| |_| \\__,_| \\__,_|",
--  },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc b m", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      { "  Quit", "Spc q q", "Quit" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
