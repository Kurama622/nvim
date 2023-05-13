-- vim.cmd [[doautocmd mkdp_init BufEnter]]

-- local g = vim.g
-- g.mkdp_auto_start = 0
-- g.mkdp_auto_close = 1
-- g.mkdp_refresh_slow = 0
-- g.mkdp_command_for_global = 0
-- g.mkdp_open_to_the_world = 0
-- g.mkdp_open_ip = ''
-- g.mkdp_browser = 'google-chrome-stable'
-- g.mkdp_echo_preview_url = 0
-- g.mkdp_browserfunc = ''
-- g.mkdp_markdown_css = ''
-- g.mkdp_highlight_css = ''
-- g.mkdp_port = ''
-- g.mkdp_page_title = '${name}'
-- g.table_mode_corner='|'
-- g.table_mode_corner_corner='|'
-- default config:

require('peek').setup({
  auto_load = true,         -- whether to automatically load preview when
                            -- entering another markdown buffer
  close_on_bdelete = true,  -- close preview window on buffer delete

  syntax = true,            -- enable syntax highlighting, affects performance

  theme = 'dark',           -- 'dark' or 'light'

  update_on_change = true,

  app = 'webview',          -- 'webview', 'browser', string or a table of strings
                            -- explained below

  filetype = { 'markdown' },-- list of filetypes to recognize as markdown

  -- relevant if update_on_change is true
  throttle_at = 200000,     -- start throttling when file exceeds this
                            -- amount of bytes in size
  throttle_time = 'auto',   -- minimum amount of time in milliseconds
                            -- that has to pass before starting new render
})
vim.api.nvim_create_user_command('MarkdownPreview', require('peek').open, {})
vim.api.nvim_create_user_command('MarkdownPreviewClose', require('peek').close, {})
