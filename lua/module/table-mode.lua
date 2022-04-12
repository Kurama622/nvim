local M = {}
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
function M.setup()
    keymap('n', '<leader>tm', ':TableModeToggle<cr>', opts)
end
return M
