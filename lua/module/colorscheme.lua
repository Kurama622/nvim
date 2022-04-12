-- tokyodark
--[[ vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark") ]]

-- catppuccin
--[[ require("catppuccin").setup(
{
    transparent_background = false,
    term_colors = false,
    styles = {
        -- comments = "italic",
        comments = "NONE",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "italic",
    },
    integrations = {
        treesitter = true,
        native_lsp = { enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = false,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        neotree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
        },
        which_key = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        dashboard = false,
        neogit = false,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = false,
        notify = true,
        telekasten = true,
        symbols_outline = true,
    }
})
vim.cmd("colorscheme catppuccin") ]]

-- github-nvim-theme
--[[ require("github-theme").setup({
  theme_style = "dark",
  -- theme_style = "dark_colorblind",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
}) ]]

-- zephyr-nvim
-- require('zephyr')

-- darkplus
local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
