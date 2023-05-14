local autocmd = vim.api.nvim_create_autocmd
local user_showtabline = 2
local user_laststatus = 3

-- Change mapleader and maplocalleader from space to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

local dash_group = vim.api.nvim_create_augroup("NvDash_au", { clear = true })
autocmd("Filetype", {
  pattern = "nvdash",
  desc = "disable status and tabline entering nvdash",
  group = dash_group,
  callback = function()
    if vim.opt.showtabline ~= nil then
      user_showtabline = vim.opt.showtabline
    else
      user_showtabline = 2
    end
    if vim.opt.laststatus ~= nil then
      user_laststatus = vim.opt.laststatus
    else
      user_laststatus = 3
    end
    vim.cmd([[ setlocal nonumber norelativenumber nocursorline noruler ]])
    vim.opt.showtabline = 0
    vim.opt.laststatus = 0
  end
})
autocmd("BufUnload", {
  desc = "enable status and tabline after nvdash",
  group = dash_group,
  callback = function()
    if vim.bo.filetype == "nvdash" then
      if user_showtabline ~= nil then
        vim.opt.showtabline = user_showtabline
      else
        vim.opt.showtabline = 2
      end
      if user_laststatus ~= nil then
        vim.opt.laststatus = user_laststatus
      else
        vim.opt.laststatus = 3
      end
    end
  end,
})

local term_group = vim.api.nvim_create_augroup("NvTerm_au", { clear = true })
autocmd({ "BufEnter" }, {
  desc = "preserve status and tabline entering nvterm",
  group = term_group,
  pattern = "term://*",
  callback = function()
    if vim.opt.showtabline ~= nil then
      user_showtabline = vim.opt.showtabline
    else
      user_showtabline = 2
    end
    if vim.opt.laststatus ~= nil then
      user_laststatus = vim.opt.laststatus
    else
      user_laststatus = 3
    end
    vim.opt.showtabline = 0
    vim.opt.laststatus = 0
  end,
})

autocmd({ "BufLeave" }, {
  desc = "preserve status and tabline leaving nvterm",
  group = term_group,
  pattern = "term://*",
  callback = function()
    if user_showtabline ~= nil then
      vim.opt.showtabline = user_showtabline
    else
      vim.opt.showtabline = 2
    end
    if user_laststatus ~= nil then
      vim.opt.laststatus = user_laststatus
    else
      vim.opt.laststatus = 3
    end
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
