--print('sourced 🫡')

vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
vim.wo.number = true
vim.opt.relativenumber = true
--vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.cursorline = true

vim.keymap.set('n', '<leader>rh', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>so', ':so<Enter>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Explore)

--vim.keymap.set('n', '<C>b', vim.)
