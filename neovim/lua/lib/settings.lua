local libTables = require('lib/tables')

local M = {}


local widthCycle = {
  [100] = 120,
  [120] = 80,
  [80] = 100,
}

--- Cycle the textwidth
-- 100 -> 120 -> 80 -> 100
-- If the current textwidth isn't part of the cycle, then it will restart at 100
M.cycleColumns = function()
  local current = vim.o.textwidth
  local next = libTables.advanceCycle(widthCycle, current, 100)

  vim.o.textwidth = next

  vim.print(next)
end


IndentationMode = 's2'

local indentationModeCycle = {
  s2 = 's4',
  s4 = 't2',
  t2 = 't4',
  t4 = 's2',
}

local indentationModeMessages = {
  s2 = 'Tab = 2 Spaces',
  s4 = 'Tab = 4 Spaces',
  t2 = 'Tab = 1 Tab, 2 Spaces Wide',
  t4 = 'Tab = 1 Tab, 4 Spaces Wide',
}

local setIndentationMode = function(mode)
  local tabCharacter = string.sub(mode, 0, 1)
  local tabWidth = tonumber(string.sub(mode, 1, 2))
  local expandtab = tabCharacter == 's'

  vim.opt.expandtab = expandtab
  vim.opt.shiftwidth = tabWidth
  vim.opt.tabstop = tabWidth
  IndentationMode = mode
end

--- Cycle the indentation mode
-- 2 Spaces -> 4 Spaces -> 2 Space Tab -> 4 Space Tab -> 2 Spaces
M.cycleIndentationMode = function()
  local current = IndentationMode
  local next = libTables.advanceCycle(indentationModeCycle, current, 's2')
  local message = indentationModeMessages[next]

  setIndentationMode(next)

  vim.print(message)
end


return M
