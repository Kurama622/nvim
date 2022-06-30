local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local always_ignore_these = {
  'node_modules/.*',
  '%.git/.*',
  '%.svg',
  '%.png',
  '%.jpeg',
  '%.jpg',
  '%.ico',
  '%.webp',
  '%.avif',
  '%.heic',
  '%.mp3',
  '%.mp4',
  '%.mkv',
  '%.mov',
  '%.wav',
  '%.flv',
  '%.avi',
  '%.webm',
  '.env.*',
}
local ignore_these = vim.tbl_extend('keep', always_ignore_these, {
  '_site/.*',
  '_next/.*',
  'dist/.*',
  'build/.*',
  'fonts/.*',
  'icons/.*',
  'images/.*',
  '.env.*',
  '.yarn/.*',
  'yarn.lock',
  'package%-lock.json',
  '.neuron/.*',
})

require('telescope').setup{
defaults = {
  mappings = {
  i = {
    ["<c-n>"] = actions.cycle_history_next,
    ["<c-p>"] = actions.cycle_history_prev,
    ["<c-j>"] = actions.move_selection_next,
    ["<c-k>"] = actions.move_selection_previous,
  },
  n = {
    ["?"] = actions.which_key,
    ["cd"] = function(prompt_bufnr)
      local selection = require("telescope.actions.state").get_selected_entry()
      local dir = vim.fn.fnamemodify(selection.path, ":p:h")
      require("telescope.actions").close(prompt_bufnr)
      vim.cmd(string.format("silent lcd %s", dir))
    end
  }
  },
  color_devicons = true,
  file_ignore_patterns = ignore_these,
  prompt_prefix = '🔍 ',
  layout_strategy = 'flex',
  layout_config = {
    prompt_position = 'bottom',
    horizontal = {
      mirror = false,
      preview_cutoff = 100,
      preview_width = 0.5,
    },
    vertical = {
      mirror = false,
      preview_cutoff = 0.4,
    },
    flex = {
      flip_columns = 110,
    },
    height = 0.94,
    width = 0.86,
  },
},
pickers = {
  find_files = {
    find_command = { 'rg', '--files', '-L' },
    follow = true,
    hidden = true,
    no_ignore = false,
  },
},
extensions = {
    --[[ file_browser = {
      -- theme = "dropdown",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    } ]]
  }
}
-- require("telescope").load_extension "file_browser"

--[[ local keymap = vim.api.nvim_set_keymap
local ops = { noremap = true, silent = true }
keymap('n', '<c-f>', ':lua require(\'telescope.builtin\').find_files()<cr>', ops)
keymap('n', '<c-b>', ':lua require(\'telescope.builtin\').buffers()<cr>', ops)
keymap('n', '<c-l>', ':lua require(\'telescope.builtin\').live_grep()<cr>', ops)
keymap('n', '<c-h>', ':lua require(\'telescope.builtin\').oldfiles()<cr>', ops)
keymap('n', '<M-h>', ':lua require(\'telescope.builtin\').help_tags()<cr>', ops) ]]
-- keymap('n', '<leader>fb', ':Telescope file_browser<cr>', ops)


