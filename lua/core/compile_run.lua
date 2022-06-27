local command = vim.api.nvim_command
local keymap = vim.api.nvim_set_keymap

function CompileRun()
    local filetype = vim.bo.filetype

    if filetype == "python" then
        command("lua require('FTerm').scratch({cmd = 'python3 '..vim.api.nvim_buf_get_name(0)})")
    elseif filetype == "cpp" then
        command("lua require('FTerm').scratch({cmd = 'g++ '..vim.api.nvim_buf_get_name(0) .. ' -Wall -o ' .. vim.fn.expand('%<') .. ' && ./' .. vim.fn.expand('%<')})")
    elseif filetype == "lua" then
        command("luafile %")
    elseif filetype == "sh" then
        command("!sh %")
    elseif filetype == "markdown" then
        command("MarkdownPreview")
    end
end

keymap('n', '<f5>', ':lua CompileRun()<cr>', {noremap = true, silent = true})
