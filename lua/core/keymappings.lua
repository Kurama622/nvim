local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n',  '<space>',          '<nop>',                                    opts)
vim.g.mapleader = ' '
keymap('n',  '<leader><cr>',     ':set hlsearch!<cr>',                       opts)
keymap('n',  'S',                ':w<cr>',                                   opts)
keymap('x',  'S',                '<nop>',                                   opts)
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

-- comment
keymap('n', 'gcc', ':CommentToggle<cr>', opts)
keymap('v', 'gc', ":'<,'>CommentToggle<cr>", opts)

-- telescope
keymap('n', '<c-f>', ':Telescope find_files<cr>', opts)
keymap('n', '<c-b>', ':Telescope buffers<cr>', opts)
keymap('n', '<c-l>', ':Telescope live_grep<cr>', opts)
keymap('n', '<c-h>', ':Telescope oldfiles<cr>', opts)
keymap('n', '<M-h>', ':Telescope help_tags<cr>', opts)

-- nvim-dap
keymap("n", "<leader>db", ":DapToggleBreakpoint<cr>", opts)
keymap("n", "<leader>dr", ":DapToggleRepl<cr>", opts)
keymap('n', "<F10>", "<cmd>DapContinue<cr>", opts)
keymap("n", "<F4>", ":DapTerminate<cr>", opts)
keymap("n", "<F2>", ":DapContinue<cr>", opts)
keymap("n", "<F6>", ":DapStepOver<cr>", opts)
keymap("n", "<F7>", ":DapStepInto<cr>", opts)
keymap("n", "<F8>", ":DapStepOut<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>p", "<cmd>lua require'dapui'.eval()<cr>", opts)
keymap('n', '<f5>', ':FloatRun<cr>', {noremap = true, silent = true})
keymap('n', '<leader>g', ':GitBlameToggle<cr>', {noremap = true, silent = true})

-- keymap('n', "<F10>", "<cmd>lua require'debugger.dap-util'.reload_continue()<CR>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>", opts)
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
-- keymap("n", "<F2>", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)

-- vim.g.clipboard = {
--     name = 'win32yank',
--     copy = {
--         ['+'] = 'win32yank.exe -i --crlf',
--         ['*'] = 'win32yank.exe -i --crlf',
--     },
--     paste = {
--         ['+'] = 'win32yank.exe -o --lf',
--         ['*'] = 'win32yank.exe -o --lf',
--     },
--     cache_enabled = 0
-- }

-- vim.g.clipboard = {
--     name = 'win32yank',
--     copy = {
--         ['+'] = 'clip.exe',
--         ['*'] = 'clip.exe',
--     },
--     paste = {
--         ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--         ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0
-- }

--[[ debugger keymap ]]
-- $HOME/.config/nvim/lua/debugger/dap.lua

--[[ compile keymap ]]
-- $HOME/.config/nvim/lua/core/compile_run.lua

--[[ find file keymap ]]
-- $HOME/.config/nvim/lua/module/telescope.lua

--[[ completion keymap ]]
-- $HOME/.config/nvim/lua/completion/cmp.lua
