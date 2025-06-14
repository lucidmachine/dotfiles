local M = {}


--- Get the relative path to the current file
M.getCurrentFileRelativePath = function()
  return vim.fn.expand('%:P')
end

--- Get the absolute path to the current file
M.getCurrentFileAbsolutePath = function()
  return vim.fn.expand('%:p')
end


return M
