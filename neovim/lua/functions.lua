local M = {}

local advanceCycle = function(cycle, currentKey, default)
  return cycle[currentKey] or default
end


local widthCycle = {
  [100] = 120,
  [120] = 80,
  [80] = 100,
}

--- Cycle the textwidth and color column
-- 100 -> 120 -> 80 -> 100
-- If the current textwidth isn't part of the cycle, then it will restart at 100
M.cycleColumns = function()
  local current = vim.o.textwidth
  local next = advanceCycle(widthCycle, current, 100)

  vim.o.textwidth = next
  vim.o.colorcolumn = tostring(next + 1)

  vim.print(next)
end


local inccommandCycle = {
  ['split'] = 'nosplit',
  ['nosplit'] = 'split',
}

--- Cycle the inccommand mode
-- split -> nosplit -> split
M.cycleInccommand = function()
  local current = vim.o.inccommand
  local next = advanceCycle(inccommandCycle, current, 'split')

  vim.o.inccommand = next

  vim.print(next)
end


return M
