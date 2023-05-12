local autocmd = vim.api.nvim_create_autocmd

-- TODO: figure out how to disable tabline and statusline for nvdash
local dash_group = vim.api.nvim_create_augroup("NvDash_au", { clear = true })
autocmd("Filetype", {
  pattern = "nvdash",
  group = dash_group,
  callback = function()
    -- require("lualine").hide({
    --   place = { "statusline", "tabline", "winbar" },
    --   unhide = false,
    -- })
    vim.cmd([[ setlocal nonumber norelativenumber nocursorline noruler ]])
  end,
})
autocmd("BufUnload", {
  desc = "enable status and tabline after nvdash",
  group = dash_group,
  callback = function()
    -- require("lualine").hide({
    --   place = { "statusline", "tabline", "winbar" },
    --   unhide = true,
    -- })
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})
