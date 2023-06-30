print("neovim configuration sourced 😊")

-- KEY MAPPING
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- EDITOR SETTINGS
vim.wo.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false --equivalent to command ":noh"
