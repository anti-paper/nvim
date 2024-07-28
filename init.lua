require('base')
require('setup_plugin')
require('plugins/colorscheme')
require('plugins/nvim_tree')
require('telescope').setup {
    pickers = {
        find_files = {
            find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>p', builtin.find_files, {})
vim.keymap.set('n', '<space>f', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
require('plugins/nvim_web_devicons')
require('plugins/lualine')
require('plugins/lspconfig')
require('plugins/nvim_cursorline')
require('plugins/colorizer')
require('plugins/gitsigns')
require('plugins/auto_save')
require('plugins/bufferline')
require('plugins/toggleterm')
