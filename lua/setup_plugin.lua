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
    {'tani/vim-jetpack', opt = 1}, -- bootstrap
    'navarasu/onedark.nvim',
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
    {'nvim-tree/nvim-tree.lua',
        requires = {
          'nvim-tree/nvim-web-devicons',
        }
    },
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope.nvim', tag = '0.1.4' },
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-lualine/lualine.nvim',
      requires = 'kyazdani42/nvim-web-devicons'
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'yamatsum/nvim-cursorline',
    'pechorin/any-jump.vim',
    {'numToStr/Comment.nvim', config = function() require('Comment').setup() end},
    'norcalli/nvim-colorizer.lua',
    'dinhhuy258/git.nvim',
    'lewis6991/gitsigns.nvim',
}
