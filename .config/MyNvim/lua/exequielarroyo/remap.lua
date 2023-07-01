-- KEY MAPPING
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pc', ':echo stdpath("config")') --printing config location
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") --moving selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") --moving selected lines


--TELESCOPE
