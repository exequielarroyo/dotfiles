print('sourced 🫡')

vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.cursorline = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>so', ':so<Enter>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Explore)
