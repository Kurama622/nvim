local M = {}

local function config_dapi_and_sign()
  local dap_install = require "dap-install"
  dap_install.setup {
    installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
  }

  local dap_breakpoint = {
    error = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "➜", 
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function config_dapui()
  -- dapui config
  local dap, dapui = require "dap", require "dapui"
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
    dapui.close("tray")
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  -- for some debug adapter, terminate or exit events will no fire, use disconnect reuest instead
  dap.listeners.before.disconnect["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  -- TODO: wait dap-ui for fixing temrinal layout
  -- the "30" of "30vsplit: doesn't work
  -- dap.defaults.fallback.terminal_win_cmd = '30vsplit new' -- this will be overrided by dapui
end


local function config_debuggers()
  -- load from json file
  require('dap.ext.vscode').load_launchjs(nil, {cppdbg = {'cpp'}})
  require("debugger.dap-cpp")
  require("debugger.dap-python")
end

function M.setup()
  config_dapi_and_sign()
  config_dapui()
  config_debuggers() -- Debugger
end


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap('n', "<F10>", "<cmd>lua require'debugger.dap-util'.reload_continue()<CR>", opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F2>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>p", "<cmd>lua require'dapui'.eval()<cr>", opts)

return M
