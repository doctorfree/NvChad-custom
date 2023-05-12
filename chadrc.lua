---@type ChadrcConfig
local M = {}

-- pick a random dashboard header
local header = require("custom.headers")["random"]

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

    header = header,
    -- header = {
    --   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    --   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    --   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    --   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    -- },

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

M.lazy_nvim = {
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
  },
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
