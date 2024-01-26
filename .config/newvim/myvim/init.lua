vim.g.mapleader = ' '
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.shiftwidth = 4
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.hlsearch = false

vim.keymap.set('n', 'ep', vim.cmd.Explore)
vim.keymap.set('n', 'ed', ':edit<CR>')
vim.keymap.set('n', '<leader>so', ':source<CR>')

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)


-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins', opts)

-- treesitter
-- local configs = require("nvim-treesitter.configs")
-- configs.setup({
--     ensure_installed = { },
--     sync_install = false,
--     highlight = { enable = true },
--     indent = { enable = true },
--     autotag = { enable = true, enable_rename = true, },
-- })

-- colorsheme
-- require('vscode').load()

-- lualine
-- require('lualine').setup({
--[[ options = {
		    theme = 'dracula',
    } ]]
-- })

-- lsp
