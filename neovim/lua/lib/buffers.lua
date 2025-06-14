local M = {}


--- Get the contents of the current buffer as a string
M.getCurrentBufferContents = function()
  local currentBufferLines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local currentBufferContents = table.concat(currentBufferLines, '\n')

  return currentBufferContents
end


return M
