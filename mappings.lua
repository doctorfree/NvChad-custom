---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>qq"] = { "<cmd> quitall! <CR>", "quit" },
    ["<leader>tT"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency"
    },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme"
    },
  },
}

-- Extras example
-- M.symbols_outline = {
--   n = {
--     ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
--   },
-- }

-- more keybinds!

return M
