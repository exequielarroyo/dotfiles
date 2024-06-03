-- EDITOR SETTINGS
vim.wo.number = true
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false --equivalent to command ":noh"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true

-- KEY MAPPING
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pc', ':echo stdpath("config")') --printing config location
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") --moving selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") --moving selected lines
