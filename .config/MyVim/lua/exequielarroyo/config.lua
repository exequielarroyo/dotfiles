print('sourced 🫡')

vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
vim.wo.number = true
vim.opt.relativenumber = true
--vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.cursorline = true

vim.keymap.set('n', '<leader>rh', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>so', ':so<Enter>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Explore)
