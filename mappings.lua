---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>P"] = { "<cmd> Lazy <CR>", "Lazy plugin mgr" },
    ["<leader>M"] = { "<cmd> Mason <CR>", "Mason package mgr" },
    ["<leader>H"] = { "<cmd> Htop <CR>", "Htop system monitor" },
    ["<leader>G"] = { "<cmd> Lazygit <CR>", "Lazygit command" },
    ["<leader>L"] = { "<cmd> Lazyman <CR>", "Lazyman menu" },
    ["<leader>C"] = { "<cmd> Lazyconf <CR>", "Lazyman configuration" },
    ["<leader>A"] = { "<cmd> Asciiville <CR>", "Asciiville" },
    ["<leader>q"] = { "<cmd> quitall! <CR>", "quit" },
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

M.symbols_outline = {
  n = {
    ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
  },
}

return M
