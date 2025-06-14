local M = {}

--- Advance a cycle data structure to the next value if present, else to the given default value
M.advanceCycle = function(cycle, currentKey, default)
  return cycle[currentKey] or default
end

return M
