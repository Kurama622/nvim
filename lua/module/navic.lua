require("nvim-navic").setup {
    icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
    highlight = false,
    separator = " › ",
    depth_limit = 5,
    depth_limit_indicator = "..",
}
vim.api.nvim_set_hl(0, "NavicIconsFile", { link = "CmpItemKindFile" })
vim.api.nvim_set_hl(0, "NavicIconsModule", { link = "CmpItemKindClass" })
vim.api.nvim_set_hl(0, "NavicIconsNamespace", { link = "CmpItemKindClass" })
vim.api.nvim_set_hl(0, "NavicIconsPackage", { link = "CmpItemKindProperty" })
vim.api.nvim_set_hl(0, "NavicIconsClass", { link = "CmpItemKindClass" })
vim.api.nvim_set_hl(0, "NavicIconsMethod", { link = "CmpItemKindMethod" })
vim.api.nvim_set_hl(0, "NavicIconsProperty", { link = "CmpItemKindProperty" })
vim.api.nvim_set_hl(0, "NavicIconsField", { link = "CmpItemKindField" })
vim.api.nvim_set_hl(0, "NavicIconsConstructor", { link = "CmpItemKindConstructor" })
vim.api.nvim_set_hl(0, "NavicIconsEnum", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsInterface", { link = "CmpItemKindInterface" })
vim.api.nvim_set_hl(0, "NavicIconsFunction", { link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsConstant", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsString", { link = "CmpItemKindText" })
vim.api.nvim_set_hl(0, "NavicIconsNumber", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsBoolean", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "NavicIconsArray", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsObject", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsKey", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "NavicIconsNull", { link = "TSNone" })
vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "NavicIconsStruct", { link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "NavicIconsEvent", { link = "CmpItemKindEvent" })
vim.api.nvim_set_hl(0, "NavicIconsOperator", { link = "CmpItemKindOperator" })
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { link = "CmpItemKindTypeParameter" })
vim.api.nvim_set_hl(0, "NavicText", { link = "Keyword" })
vim.api.nvim_set_hl(0, "NavicSeparator", { link = "Constant" })
-- vim.api.nvim_set_hl(0, "NavicSeparator", { link = "WhiteSpace" })
-- local theme = require("zephyr")
-- local bg_color = theme.bg
-- local blue_color = theme.blue
-- local yello_color = theme.yellow
-- vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = bg_color,  fg = blue_color})
-- vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = bg_color,  fg = yello_color})
-- vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = bg_color,  fg = blue_color})

