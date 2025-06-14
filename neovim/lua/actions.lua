local libBuffers = require('lib/buffers')
local libLsp = require('lib/lsp')
local libPaths = require('lib/paths')
local libSelection = require('lib/selection')
local libSettings = require('lib/settings')


local M = {}


M.cycleColumns = libSettings.cycleColumns
M.cycleIndentationMode = libSettings.cycleIndentationMode

--- Copy the contents of the current buffer to the clipboard
M.copyBufferToClipboard = function()
  local currentBufferContents = libBuffers.getCurrentBufferContents()

  vim.fn.setreg('+', currentBufferContents)
end

--- Copy the visual selection to the clipboard
M.copyVisualSelectionToClipboard = function()
  local visualSelectionContents = libSelection.getVisualSelectionContents()

  vim.fn.setreg('+', visualSelectionContents)
end

--- Copy the relative path of the current file to the clipboard
M.copyCurrentFileRelativePathToClipboard = function()
  vim.fn.setreg('+', libPaths.getCurrentFileRelativePath())
end

--- Copy the absolute path of the current file to the clipboard
M.copyCurrentFileAbsolutePathToClipboard = function()
  vim.fn.setreg('+', libPaths.getCurrentFileAbsolutePath())
end

--- Jump to the next diagnostic
M.nextDiagnostic = function()
  vim.diagnostic.jump({count = 1, float = true})
end

--- Jump to the previous diagnostic
M.prevDiagnostic = function()
  vim.diagnostic.jump({count = -1, float = true})
end

--- Organizes LSP to organize imports when available
M.smartOrganizeImports = function()
  require('jdtls').organize_imports()
end

--- Rename the symbol under the cursor. Uses LSP rename method if available, else Scalpel.
M.smartRename = function()
  if libLsp.isMethodSupportedByLspInCurrentBuf('rename') then
    vim.lsp.buf.rename(nil)
  else
    vim.cmd('<Plug>(Scalpel)')
  end
end


return M
