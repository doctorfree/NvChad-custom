local autocmd = vim.api.nvim_create_autocmd

local dash_group = vim.api.nvim_create_augroup("NvDash_au", { clear = true })
autocmd("Filetype", {
  pattern = "nvdash",
  group = dash_group,
  callback = function()
    vim.opt.showtabline = 0
    vim.cmd([[ setlocal nonumber norelativenumber nocursorline noruler ]])
  end,
})
autocmd("BufUnload", {
  desc = "enable status and tabline after nvdash",
  group = dash_group,
  callback = function()
    if vim.bo.filetype == "nvdash" then
      vim.opt.showtabline = 2
    end
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
