local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n',  '<space>',          '<nop>',                                    opts)
vim.g.mapleader = ' '
keymap('n',  '<leader><cr>',     ':set hlsearch!<cr>',                       opts)
keymap('n',  'S',                ':w<cr>',                                   opts)
keymap('n',  's',                '<nop>',                                    opts)
keymap('n',  'Q',                ':quit<cr>',                                opts)
keymap('n',  'sl',               ':set splitright<cr>:vsplit<cr>',           opts)
keymap('n',  'sh',               ':set nosplitright<cr>:vsplit<cr>',         opts)
keymap('n',  'sk',               ':set nosplitbelow<cr>:split<cr>',          opts)
keymap('n',  'sj',               ':set splitbelow<cr>:split<cr>',            opts)
keymap('n',  'rc',               ':source $MYVIMRC<cr>',                     opts)
keymap('n',  '<leader>rc',       ':e $MYVIMRC<cr>',                          opts)
keymap('n',  '<leader>h',        '<c-w>h',                                   opts)
keymap('n',  '<leader>l',        '<c-w>l',                                   opts)
keymap('n',  '<leader>k',        '<c-w>k',                                   opts)
keymap('n',  '<leader>j',        '<c-w>j',                                   opts)
keymap('n',  '<cr>',             'o<esc>',                                   opts)
keymap('n',  '^',                '0',                                        opts)
keymap('n',  '0',                '^',                                        opts)
keymap('v',  '^',                '0',                                        opts)
keymap('v',  '0',                '^',                                        opts)
keymap('n',  '<leader>t',        ':set splitright<cr>:vsplit<cr>:term<cr>i', opts)
keymap('n',  '+y',               '\"+y',                                     opts)
keymap('n',  '+p',               '\"+p',                                     opts)
keymap('v',  '+y',               '\"+y',                                     opts)
keymap('v',  '+p',               '\"+p',                                     opts)
keymap('n',  '<up>',             ':res +5<cr>',                              opts)
keymap('n',  '<down>',           ':res -5<cr>',                              opts)
keymap('n',  '<left>',           ':vertical resize -5<cr>',                  opts)
keymap('n',  '<right>',          ':vertical resize +5<cr>',                  opts)
keymap('n',  '<leader><leader>', '<esc>/<++><CR>:nohlsearch<cr>c4l',         opts)
keymap('n', '<leader>tm', ':TableModeToggle<cr>', opts)

--[[ debugger keymap ]]
-- $HOME/.config/nvim/lua/debugger/dap.lua

--[[ compile keymap ]]
-- $HOME/.config/nvim/lua/core/compile_run.lua

--[[ find file keymap ]]
-- $HOME/.config/nvim/lua/module/telescope.lua

--[[ completion keymap ]]
-- $HOME/.config/nvim/lua/completion/cmp.lua
