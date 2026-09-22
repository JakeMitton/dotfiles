vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'ji', '<Esc>')
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

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

-- fuzzy finder
vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local fzf = require('fzf-lua')
fzf.setup({})

vim.keymap.set('n', '<leader>ff', fzf.files,     { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Grep project' })
vim.keymap.set('n', '<leader>fb', fzf.buffers,   { desc = 'Find open buffers' })
vim.keymap.set('n', '<leader>fr', fzf.oldfiles,  { desc = 'Recent files' })
vim.keymap.set('n', '<leader>fh', fzf.helptags,  { desc = 'Search help' })

-- treesitter
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter').install({
  'c', 'cpp', 'asm', 'make', 'cmake', 'linkerscript',
  'bash', 'lua', 'vim', 'vimdoc', 'toml', 'tmux', 'markdown', 'python',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- lsp
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--query-driver=/Applications/ArmGNUToolchain/**/arm-none-eabi-*',
  },
  filetypes = { 'c', 'cpp' },
  root_markers = { 'compile_commands.json', '.clangd', '.git' },
})
vim.lsp.enable('clangd')

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local map = function(keys, fn, desc)
      vim.keymap.set('n', keys, fn, { buffer = args.buf, desc = desc })
    end

    map('gd', vim.lsp.buf.definition, 'Go to definition')
    map('<leader>d', vim.diagnostic.open_float, 'Show error under cursor')

    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get, { buffer = args.buf, desc = 'Trigger completion' })
  end,
})


-- Fuzzy Symbol Search
vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, { desc = 'Find symbols in file' })
