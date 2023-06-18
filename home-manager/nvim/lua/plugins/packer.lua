return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }

    use { "nvim-telescope/telescope-file-browser.nvim" }

    use { 'nvim-telescope/telescope-media-files.nvim' }

    use {'nvim-telescope/telescope-ui-select.nvim' }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- Bufferline
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Status bar
    use 'nvim-lualine/lualine.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/nvim-cmp'
    use 'ray-x/lsp_signature.nvim'
    use 'onsails/lspkind-nvim'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use {
      'nvim-treesitter/playground',
    }

    use 'lewis6991/gitsigns.nvim'

    -- Theming
    use 'rktjmp/lush.nvim'

    use 'simrat39/rust-tools.nvim'

    use 'rcarriga/nvim-notify'

    use 'simrat39/symbols-outline.nvim'

    use 'RRethy/vim-illuminate'

    use 'nvim-orgmode/orgmode'

    use '~/dev/apollo'
end)
