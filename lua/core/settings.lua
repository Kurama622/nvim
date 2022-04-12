local o = vim.o
local fn = vim.fn
local op = vim.opt
local my_undodir = fn.stdpath('config')..'/tmp/undo'
local my_backupdir = fn.stdpath('config')..'/tmp/backup'
if fn.isdirectory(my_backupdir) == 0 then
    vim.api.nvim_command("!mkdir -p " .. my_backupdir)
    vim.api.nvim_command("!mkdir -p " .. my_undodir)
end
o.number         = true
o.relativenumber = true
o.cursorline     = true
o.expandtab      = true
o.smartindent    = true
o.termguicolors  = true
o.undofile       = true
o.undodir        = my_undodir
o.backupdir      = my_backupdir
o.signcolumn     = 'yes'
o.mouse          = 'a'
o.ts             = 4
o.shiftwidth     = 4
op.list          = true
op.listchars     = {tab = '▸ ', trail = '▫'}  -- op.listchars     = {tab = '▸ ', trail = '▫', eol = '↵'}

vim.cmd [[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 

function! Fcitx2en()
    let input_status = system('fcitx5-remote')
    if input_status == 2
        let b:inputtoggle = 1
        call system('fcitx5-remote -c')
    endif
endfunction
function! Fcitx2zh()
    try
    if b:inputtoggle == 1
        call system('fcitx5-remote -o')
        let b:inputtoggle = 0
    endif
    catch /inputtoggle/
        let b:inputtoggle = 0
    endtry
endfunction

au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()
]]
