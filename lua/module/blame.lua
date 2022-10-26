vim.cmd [[ 
  let g:gitblame_enabled = 0
  let g:gitblame_message_template = '  <author> • <date> • <summary> • <sha> '
  let g:gitblame_date_format = '%r'
  let g:gitblame_position = "right_align"
  " let g:gitblame_highlight_group = "Question"
  let g:gitblame_set_extmark_options = {
    \ 'priority': 13,
    \ }
]]
