local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    local vim = vim
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
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
        event = 'InsertEnter',
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        after = 'nvim-cmp'
    }
    use {
        "rafamadriz/friendly-snippets",
        event = "VimEnter"
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
    use { 'dsych/galaxyline.nvim',
        branch = 'bugfix/diagnostics',
        config = function()
            require 'module.statusline'
        end,
        requires = {'kyazdani42/nvim-web-devicons'},
        event = 'InsertEnter',
    }

    -- colortheme
    use 'lunarvim/darkplus.nvim'

    -- floating term
    use 'numToStr/FTerm.nvim'

    -- edit
    use {
        'windwp/nvim-autopairs',
        config = function()
            require 'module.autopairs'
        end,
        after= 'nvim-cmp',
    }
    use 'numToStr/Comment.nvim'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require "module.indent-blankline"
        end,
        event = "InsertEnter"
    }
    use {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end,
        event = "VimEnter"
    }

    -- test nvim startup time
    use 'dstein64/vim-startuptime'

    -- file find
    use { 'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require "module.telescope"
        end,
        event = 'VimEnter'
        -- cmd = {
        --     "lua require('telescope.buildin').find_files()",
        --     "lua require('telescope.buildin').oldfiles()",
        --     "lua require('telescope.buildin').buffers()",
        --     "lua require('telescope.buildin').live_grep()",
        --     "lua require('telescope.buildin').help_tags()",
        -- }
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

    -- debug
    use "ravenxrz/DAPInstall.nvim"
    use {
        'mfussenegger/nvim-dap',
        config = function()
            require "debugger.dap"
        end,
        event = 'VimEnter'
    }
    use {
        "rcarriga/nvim-dap-ui",
        config = function()
            require "debugger.dapui"
        end,
        after = 'nvim-dap'
    }
    use {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require "debugger.dap-virtual-text"
        end,
        after = 'nvim-dap-ui'
    }
    if packer_bootstrap then
        require('packer').sync()
    end

end)

