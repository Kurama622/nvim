local o = vim.o
local fn = vim.fn
local op = vim.opt
local my_undodir = fn.stdpath('config')..'/tmp/undo'
local my_backupdir = fn.stdpath('config')..'/tmp/backup'
local my_swapdir = fn.stdpath('config')..'/tmp/swap'
if fn.isdirectory(my_backupdir) == 0 then
  vim.api.nvim_command("!mkdir -p " .. my_backupdir)
  vim.api.nvim_command("!mkdir -p " .. my_undodir)
  vim.api.nvim_command("!mkdir -p " .. swap)
end

-- arch wsl doesn't work
-- vim.cmd [[ 
--   if has('wsl')
--     set clipboard+=unnamedplus
--   endif
-- ]]

o.number         = true
o.relativenumber = true
o.cursorline     = true
o.expandtab      = true
o.smartindent    = true
o.termguicolors  = true
o.undofile       = true
o.backup         = true
o.cscopetag      = true
op.undodir       = my_undodir
op.backupdir     = my_backupdir
op.dir           = my_swapdir
o.signcolumn     = 'yes'
o.mouse          = 'a'
o.ts             = 4
o.shiftwidth     = 4
o.laststatus     = 2
op.list          = true
op.listchars     = {tab = '▸ ', trail = '▫'}  -- op.listchars     = {tab = '▸ ', trail = '▫', eol = '↵'}
op.display       = 'lastline'
o.winbar         = "%{%v:lua.require'nvim-navic'.get_location()%}"

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
