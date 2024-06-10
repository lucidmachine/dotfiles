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
  local next = advanceCycle(indentationModeCycle, current, 's2')
  local message = indentationModeMessages[next]

  setIndentationMode(next)

  vim.print(message)
end


local getCurrentBufferContents = function()
  local currentBufferLines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local currentBufferContents = table.concat(currentBufferLines, '\n')

  return currentBufferContents
end

--- Copy the contents of the current buffer to the clipboard
M.copyBufferToClipboard = function()
  local currentBufferContents = getCurrentBufferContents()

  vim.fn.setreg('+', currentBufferContents)
end


local getVisualSelectionContents = function()
  local mode = vim.fn.mode()

  local pos1 = vim.fn.getpos('v')
  local pos2 = vim.fn.getpos('.')

  local lines = vim.fn.getregion(pos1, pos2, { type = mode })

  return vim.fn.join(lines, '\n')
end

--- Copy the visual selection to the clipboard
M.copyVisualSelectionToClipboard = function()
  local visualSelectionContents = getVisualSelectionContents()

  vim.fn.setreg('+', visualSelectionContents)
end


local getCurrentFileRelativePath = function()
  return vim.fn.expand('%:P')
end

--- Copy relative path of the current file to the clipboard
M.copyCurrentFileRelativePathToClipboard = function()
  vim.fn.setreg('+', getCurrentFileRelativePath())
end


local getCurrentFileAbsolutePath = function()
  return vim.fn.expand('%:p')
end

--- Copy absolute path of the current file to the clipboard
M.copyCurrentFileAbsolutePathToClipboard = function()
  vim.fn.setreg('+', getCurrentFileAbsolutePath())
end

return M
