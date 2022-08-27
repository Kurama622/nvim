local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  local vim = vim
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- run
  use {
    'StubbornVegeta/FloatRun',
    cmd = {'FloatRun'},
    config = function()
        require "core.floatrun"
    end,
  }
  -- lsp
  use {
    'neovim/nvim-lspconfig',
    config = function()
        require "lsp.lspconfig"
    end,
    event = "VimEnter"
  }
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
        require "lsp.lsp_signature"
    end,
    after = "nvim-lspconfig"
  }
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
        require "lsp.lsp_installer"
    end,
    event = "VimEnter"
  }

  -- snippets
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets'
  }
  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'nvim-cmp'
  }
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
        require "completion.cmp"
    end,
    after = 'LuaSnip'
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'nvim-cmp',
  }
  use {
    "hrsh7th/cmp-nvim-lua",
    after = 'nvim-cmp',
  }
  use {
    'hrsh7th/cmp-buffer',
    after = 'cmp-nvim-lsp',
  }
  use {
    'hrsh7th/cmp-path',
    after = 'cmp-nvim-lsp',
  }
  use {
    'hrsh7th/cmp-cmdline',
    after = 'cmp-nvim-lsp',
  }

  -- highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require "module.treesitter"
    end,
    event = "InsertEnter"
  }

  -- statusline
  -- use { 'dsych/galaxyline.nvim',
  --   branch = 'bugfix/diagnostics',
  --   config = function()
  --       require 'module.statusline'
  --   end,
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   event = 'InsertEnter',
  -- }
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function()
      require 'module.statusline'
    end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    event = 'InsertEnter',
  }

  -- colortheme
  -- use 'StubbornVegeta/darkplus.nvim'
  use({
  'glepnir/zephyr-nvim',
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
})

  -- floating term
  use {
    "is0n/fm-nvim",
    cmd = {'Ranger', 'Lazygit'},
    config = function()
      require 'module.fm-nvim'
    end,
  }

  -- edit
  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'module.autopairs'
    end,
    after = 'nvim-cmp',
  }
  use {
    'mg979/vim-visual-multi',
  }

  use {
    'terrortylor/nvim-comment',
    config = function()
      require('module.comment')
    end,
    cmd = {'CommentToggle'}
  }


  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require "module.indent-blankline"
    end,
    event = "InsertEnter"
  }
  -- use {
  --     "ur4ltz/surround.nvim",
  --     config = function()
  --         require "module.surround"
  --     end,
  --     event = "VimEnter"
  -- }

  use "tpope/vim-surround"

  use {
    "kosayoda/nvim-lightbulb",
    config = function()
      require "module.nvim-lightbulb"
    end,
    after = "nvim-lspconfig"
  }
  -- test nvim startup time
  use {
    'dstein64/vim-startuptime', 
    cmd = {"StartupTime"}
  }

  -- file find
  use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} , opt=true},
    cmd = "Telescope",
    config = function()
        require "module.telescope"
    end,
  }

  -- markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    config = function()
        require "module.markdown_preview"
    end,
    cmd = "MarkdownPreview",
  }
  use {
    'dhruvasagar/vim-table-mode',
    cmd = 'TableModeToggle'
  }

  -- debug
  use {
    "ravenxrz/DAPInstall.nvim",
    cmd = {"DIInstall", "DIList", "DIUninstall"}
  }

  use {
    "rcarriga/nvim-dap-ui",
    config = function()
      require "debugger.dap-ui"
    end,
    after = 'nvim-dap'
  }
  use {
    'mfussenegger/nvim-dap',
    config = function()
        require("debugger.dap")
    end,
    cmd = {
      'DapToggleBreakpoint',
      'DapToggleRepl',
      'DapContinue',
      'DapStepOver',
      'DapStepOut',
      'DapStepInto',
      'DapTerminate'
    }
  }
  use {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require "debugger.dap-virtual-text"
    end,
    after = 'nvim-dap-ui'
  }

  -- others
  use "rcarriga/nvim-notify"
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = function()
      require "module.navic"
    end
  }
  use {
    'stevearc/aerial.nvim',
    config = function()
      require('module.aerial-nvim')
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
  
end)
