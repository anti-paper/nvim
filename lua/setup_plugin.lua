-- auto download
local fn = vim.fn
local jetpackfile = fn.stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
local jetpackurl = 'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim'
if fn.filereadable(jetpackfile) == 0 then
    fn.system('curl -fsSLo ' .. jetpackfile .. ' --create-dirs ' .. jetpackurl)
end


-- install plugins by vim-jetpack
vim.cmd('packadd vim-jetpack')


require('jetpack.paq') {
    { 'tani/vim-jetpack',                opt = 1 }, -- bootstrap
    'navarasu/onedark.nvim',
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        }
    },
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "onsails/lspkind.nvim",
    "neovim/nvim-lspconfig",
    'yamatsum/nvim-cursorline',
    'pechorin/any-jump.vim',
    { 'numToStr/Comment.nvim',         config = function() require('Comment').setup() end },
    'norcalli/nvim-colorizer.lua',
    'dinhhuy258/git.nvim',
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-ts-autotag',
    'pocco81/auto-save.nvim',
    'akinsho/bufferline.nvim',
    'windwp/nvim-autopairs',
    'RRethy/nvim-treesitter-endwise',
    'echasnovski/mini.indentscope',
    'akinsho/toggleterm.nvim',
    {
        'nvimtools/none-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'vim-test/vim-test' },
    },
    'mechatroner/rainbow_csv',
}
