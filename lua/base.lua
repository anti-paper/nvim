-- default settings
-- encoding
vim.scriptencoding = "utf-8"


-- prompt?
local wo = vim.wo
wo.list = true
wo.listchars = 'tab:»-,trail:-,eol:↩︎,extends:»,precedes:«,nbsp:%'


local opt = vim.opt

-- clipboard
opt.clipboard = "unnamedplus"


-- tab to space
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4


-- line number
opt.number = true
opt.relativenumber = true


-- cursor highlight
opt.termguicolors = true
opt.cursorline = true
opt.cursorcolumn = true


-- help language
opt.helplang = ja


-- start end set strong
opt.showmatch = true


-- key bind
local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-a>", "gg<S-v>G", opts)
keymap("i", "jj", "<Esc>", opts)
keymap("i", "っj", "<Esc>", opts)
keymap("i", "{", "{}<LEFT>", opts)
keymap("i", "[", "[]<LEFT>", opts)
keymap("i", "(", "()<LEFT>", opts)
keymap("i", "\"", "\"\"<LEFT>", opts)
keymap("i", "'", "''<LEFT>", opts)
keymap('n', '<S-e>', ':NvimTreeToggle<CR>', {silent=true})

