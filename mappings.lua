---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>L"] = { "<cmd> Lazy <CR>", "Lazy" },
    ["<leader>M"] = { "<cmd> Mason <CR>", "Mason" },
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
    ["<leader>lc"] = {
      function()
        local float_term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(float_term.job_id, "exec lazyman -F\n")
      end,
      "lazyman config"
    },
    ["<leader>lm"] = {
      function()
        local float_term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(float_term.job_id, "exec lazyman\n")
      end,
      "lazyman menu"
    },
    ["<leader>tm"] = {
      function()
        local float_term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(float_term.job_id, "exec htop\n")
      end,
      "htop system monitor"
    },
    ["<leader>lg"] = {
      function()
        local float_term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(float_term.job_id, "exec lazygit\n")
      end,
      "lazygit git commands"
    },
  },
}

-- Extras example
M.symbols_outline = {
  n = {
    ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
  },
}

-- more keybinds!

return M
