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
}
