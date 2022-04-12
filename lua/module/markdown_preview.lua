vim.cmd [[doautocmd mkdp_init BufEnter]]

local g = vim.g
g.mkdp_auto_start = 0
g.mkdp_auto_close = 1
g.mkdp_refresh_slow = 0
g.mkdp_command_for_global = 0
g.mkdp_open_to_the_world = 0
g.mkdp_open_ip = ''
g.mkdp_browser = 'google-chrome-stable'
g.mkdp_echo_preview_url = 0
g.mkdp_browserfunc = ''
g.mkdp_markdown_css = ''
g.mkdp_highlight_css = ''
g.mkdp_port = ''
g.mkdp_page_title = '${name}'
g.table_mode_corner='|'
g.table_mode_corner_corner='|'
