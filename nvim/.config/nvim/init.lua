vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'ji', '<Esc>')

-- === options ===
local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- indentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- search
opt.ignorecase = true
opt.smartcase = true

-- display
opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.cursorline = true
opt.wrap = true
opt.colorcolumn = ''
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- behaviour
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.clipboard = 'unnamedplus'

-- clear search highlight with Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Status line
opt.laststatus = 3
opt.statusline = ' %f %m%r%= %y  %l:%v  %p%% '

-- theme
vim.pack.add({ 'https://github.com/sainnhe/gruvbox-material' })

vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 1
vim.cmd.colorscheme('gruvbox-material')
