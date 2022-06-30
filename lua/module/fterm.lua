require'FTerm'.setup({
  border = 'single',
  dimensions  = {
    height = 0.8,
    width = 0.8,
  },
})
-- vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', {noremap=true, silent=true})
