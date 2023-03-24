require('exequielarroyo')
print('Exequiel Arroyo')

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.wo.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- plugin map
-- vim.keymap.set('n', '<C-p', vim.cmd.Gitsigns
