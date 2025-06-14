local M = {}


--- Get the contents of the visual selection as a string
M.getVisualSelectionContents = function()
  local mode = vim.fn.mode()

  local pos1 = vim.fn.getpos('v')
  local pos2 = vim.fn.getpos('.')

  local lines = vim.fn.getregion(pos1, pos2, { type = mode })

  return vim.fn.join(lines, '\n')
end


return M
