local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'
    use "EdenEast/nightfox.nvim" -- Packer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use 'theprimeagen/harpoon'
    use 'theprimeagen/vim-be-good'
    use 'jwalton512/vim-blade'
    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- lsp support
            {'neovim/nvim-lspconfig'},             -- required
            {'williamboman/mason.nvim'},           -- optional
            {'williamboman/mason-lspconfig.nvim'}, -- optional

            -- autocompletion
            {'hrsh7th/nvim-cmp'},         -- required
            {'hrsh7th/cmp-nvim-lsp'},     -- required
            {'hrsh7th/cmp-buffer'},       -- optional
            {'hrsh7th/cmp-path'},         -- optional
            {'saadparwaiz1/cmp_luasnip'}, -- optional
            {'hrsh7th/cmp-nvim-lua'},     -- optional

            -- snippets
            {'l3mon4d3/luasnip'},             -- required
            {'rafamadriz/friendly-snippets'}, -- optional
        }
    }
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'NvChad/nvim-colorizer.lua'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {'akinsho/bufferline.nvim', tag = "v3.*",
    -- requires = 'nvim-tree/nvim-web-devicons'
    }
    use {
    'nvim-tree/nvim-tree.lua',
    -- requires = { 'nvim-tree/nvim-web-devicons', -- optional }
    }
    use 'goolord/alpha-nvim'
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end
end)
