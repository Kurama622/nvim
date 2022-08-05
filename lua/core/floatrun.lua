local file = vim.api.nvim_buf_get_name(0)
require("FloatRun").setup{
  ui = {
    border = "single",
    float_hl = "Normal",
    border_hl = "TelescopeBorder",
    blend = 0,
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5
  },
  run_command = {
    ['cpp'] = 'g++ '..file .. ' -Wall -o ' .. vim.fn.expand('%<') .. ' && ./' .. vim.fn.expand('%<'),
    ['python'] = "python " .. file,
    ['lua'] = "luajit " .. file,
    ['sh'] = "sh " .. file,
  }
}

