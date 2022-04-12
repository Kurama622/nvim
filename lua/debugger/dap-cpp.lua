-- local dap = require('dap')
-- local extension_path = fn.stdpath('data')..'/dapinstall/ccppr_vsc/extension/debugAdapters/bin/OpenDebugAD7'
--
-- dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = "executable",
--   command = extension_path,
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = true,
--   },
--   {
--     name = 'Attach to gdbserver :1234',
--     type = 'cppdbg',
--     request = 'launch',
--     MIMode = 'gdb',
--     miDebuggerServerAddress = 'localhost:1234',
--     miDebuggerPath = '/usr/bin/gdb',
--     cwd = '${workspaceFolder}',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--   },
-- }

local dap_install = require("dap-install")
dap_install.config("ccppr_vsc", {})

