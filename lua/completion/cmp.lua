local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local window = cmp.window
require('luasnip/loaders/from_vscode').lazy_load()
require("luasnip.loaders.from_vscode").load({
    -- Load snippets from my-snippets dir ($HOME/.config/nvim/my-snippets)
    paths = {vim.fn.stdpath("config") .. "/my-snippets" }
})
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
        expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    mapping = {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),

        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            --[[ Kind icons ]]
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                path = "[Path]",
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[NVIM_LUA]",
                luasnip = "[Snippet]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path'},
    }),
    -- ... Your other configuration ...
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- documentation = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- },
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

--[[ luasnip keymap ]]
-- local keymap = vim.api.nvim_set_keymap
-- local opts = {noremap=true, silent=true}
-- keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


