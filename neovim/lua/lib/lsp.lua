local M = {}


--- Whether the current buffer has any LSP clients which support the given method
---
--- @param method string LSP method to seek
--- @return boolean result Whether the current buffer has any LSP clients which support the given
--- method
M.isMethodSupportedByLspInCurrentBuf = function(method)
  local clientsSupportingMethodInCurrentBuf = vim.lsp.get_clients({
    buffnr = 0, -- Current buffer
    method = method
  })

  return #clientsSupportingMethodInCurrentBuf > 0
end

--- Executes a given command with the optional arguments in the current workspace.
---
--- @param command string LSP command to send to the server.
--- @param arguments table? Arguments for the LSP command to send to the server.
--- @param timeoutMs integer? Time to wait for server responses in milliseconds. Default is 1000ms.
---
--- @return table<integer, {error: lsp.ResponseError?, result: any}>? result Map of
--- client_id:request_result.
--- @return string? err On timeout, cancel, or error, `err` is a string describing the failure
--- reason, and `result` is nil.
M.executeCommand = function(command, arguments, timeoutMs)
  arguments = arguments or {}
  timeoutMs = timeoutMs or 1000
  local params = {
    command = command,
    arguments = arguments,
    title = '',
  }
  return vim.lsp.buf_request_sync(0, 'workspace/executeCommand', params, timeoutMs)
end


return M
