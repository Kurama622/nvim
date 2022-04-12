require('core')                     -- $HOME/.config/nvim/lua/core/init.lua
require('module')                   -- $HOME/.config/nvim/lua/module/init.lua
-- require('lsp')                   -- $HOME/.config/nvim/lua/lsp/init.lua         (lazy load)
-- require('completion.cmp')        -- $HOME/.config/nvim/lua/completion/cmp.lua   (lazy load)

--[[ plugins ]]
-- $HOME/.config/nvim/lua/core/plugins.lua

--[[ keymappings ]]
-- $HOME/.config/nvim/lua/core/keymappings.lua

--[[ base settings ]]
-- $HOME/.config/nvim/lua/core/settings.lua

--[[ nvim event order ]]
-- vim.cmd [[
-- function! s:Log(eventName) abort
--   silent execute '!echo '.a:eventName.' >> log'
-- endfunction

-- augroup EventLoggin
--   autocmd!
--   autocmd BufRead * call s:Log('BufRead')
--   autocmd VimEnter * call s:Log('VimEnter')
--   autocmd GUIEnter * call s:Log('GUIEnter')
--   autocmd BufNewFile * call s:Log('BufNewFile')
--   autocmd BufReadPre * call s:Log('BufReadPre')
--   autocmd User * call s:Log('User')
-- augroup END
-- ]]
