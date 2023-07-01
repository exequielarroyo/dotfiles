print("neovim configuration sourced 😊")

require('exequielarroyo.remap')

-- EDITOR SETTINGS
vim.wo.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false --equivalent to command ":noh"
