local M = {}
local dap =  require'dap'

function M.reload_continue()
  package.loaded['debugger.dap'] = nil
  require('debugger.dap').setup()
  dap.continue()
end

return M
