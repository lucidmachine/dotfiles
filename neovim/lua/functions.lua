local M = {}

local nextWidths = {
  [100] = 120,
  [120] = 80,
  [80] = 100,
}

local nextWidth = function(currentWidth)
  return nextWidths[currentWidth] or 100
end

--- Cycle the column width
-- 100 -> 120 -> 80 -> 100
-- If the current textwidth isn't part of the cycle, then it will restart at 100
M.cycleColumns = function()
  local newWidth = nextWidth(vim.o.textwidth)

  vim.o.textwidth = newWidth
  vim.o.colorcolumn = tostring(newWidth + 1)

  vim.print(newWidth)
end

return M
