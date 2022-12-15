
local hi = function(colors)
    for name, opts in pairs(colors) do
        opts.default = true
        vim.api.nvim_set_hl(0, name, opts)
    end
end

require('tabline').setup({
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 2,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = false,       -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
    vim.api.nvim_set_hl(0, 'TabLineSel', {fg='#00aa00', bg='#1f1f1f'}),
    vim.api.nvim_set_hl(0, 'TabLineFill', {fg='#1f1f1f'})
})
