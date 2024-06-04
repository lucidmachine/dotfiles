local M = {}

--- Cycle the column width
-- 100 -> 120 -> 80 -> 100
-- If the current textwidth isn't part of the cycle, then it will restart at 100
M.cycleColumns = function ()
  local nextWidths = {
    [100] = 120,
    [120] = 80,
    [80] = 100,
  }
  local currentWidth = vim.o.textwidth
  local nextWidth = nextWidths[currentWidth] or 100

  vim.o.textwidth = nextWidth
  vim.o.colorcolumn = tostring(nextWidth + 1)

  vim.print(nextWidth)
end

return M
