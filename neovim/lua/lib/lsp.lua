local M = {}


--- Whether the current buffer has any LSP clients which support the given method
M.isMethodSupportedByLspInCurrentBuf = function(method)
  local clientsSupportingMethodInCurrentBuf = vim.lsp.get_clients({
    buffnr = 0, -- Current buffer
    method = method
  })

  return #clientsSupportingMethodInCurrentBuf > 0
end


return M
