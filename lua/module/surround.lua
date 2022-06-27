local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
require"surround".setup{
    mappings_style = "surround",
    keymap("x", "S", "<Plug>SurroundAddVisual", opts)
}
