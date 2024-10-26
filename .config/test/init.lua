print('configuration sourced')

-- local vim = vim

vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.mapleader = ' ' -- space
-- vim.opt.signcolumn = 'yes'
vim.opt.nu = true
vim.opt.nuw = 1
vim.opt.rnu = true
vim.opt.cul = false
vim.opt.cuc = false
vim.opt.ru = false
vim.opt.sw = 4 -- fix issue in indenting '='
vim.opt.ts = 4 -- fix issue in formating 'gq'
vim.opt.wrap = false

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
vim.keymap.set('i', '<C-C>', '<Esc>') -- solve issue in diagnostic when using CTRL+C
-- vim.keymap.del('n', 'gl', {buffer=true})
vim.keymap.set('n', '<leader>gc', vim.lsp.get_clients)

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '💢',
			[vim.diagnostic.severity.WARN] = '⚠️',
			[vim.diagnostic.severity.INFO] = 'ℹ️',
			[vim.diagnostic.severity.HINT] = '🔍',
		},
		-- linehl = {
		-- 	[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		-- },
		-- numhl = {
		-- 	[vim.diagnostic.severity.WARN] = 'WarningMsg',
		-- },
	},
})
vim.diagnostic.config({
	virtual_text = false,
	-- signs = false,
	update_in_insert = false, -- here
	underline = true,
	severity_sort = false,
	float = true,
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- delay update diagnostics
--     update_in_insert = true,
--   }
-- )

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'lua',
	callback = function(args)
		vim.lsp.start({
			name = 'lua-language-server',
			cmd = { "C:/Users/exequielarroyo/Downloads/lua-language-server-3.9.3-win32-x64/bin/lua-language-server.exe" },
			root_dir = vim.fs.root(0, { 'init.lua' }),
			settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
		})
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	-- This handler will fire when the buffer's 'filetype' is "python"
	pattern = 'php',
	callback = function(args)
		vim.lsp.start({
			name = 'intelephense',
			cmd = { "C:\\Program Files\\nodejs\\node.exe", "C:\\Program Files\\nodejs\\node_modules\\intelephense\\lib\\intelephense.js", "--stdio" },
			-- Set the "root directory" to the parent directory of the file in the
			-- current buffer (`args.buf`) that contains either a "setup.py" or a
			-- "pyproject.toml" file. Files that share a root directory will reuse
			-- the connection to the same LSP server.
			root_dir = vim.fs.root(args.buf, { 'composer.json', }),
		})
	end,
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'typescript',
	callback = function(args)
		vim.lsp.start({
			name = 'typescript-language-server',
			cmd = { "C:/Program Files/nodejs/typescript-language-server.cmd", "--stdio" },
			root_dir = vim.fs.root(args.buf, { 'tsconfig.json', }),
		})
	end,
})
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'typescript', 'html' },
	callback = function(args)
		vim.lsp.start({
			name = 'angular-language-server',
			cmd = { "C:/Program Files/nodejs/ngserver.cmd" },
			root_dir = vim.fs.root(args.buf, { 'angular.json', }),
		})
	end,
})
-- vim.cmd.highlight({
-- 	{'Normal',{guifg='white'}},
-- })
vim.cmd.highlight({ "Normal", "guifg=white" })
vim.cmd.highlight({ "StatusLine", "guifg=#222222" })
vim.cmd.highlight({ "StatusLine", "guibg=none" })
vim.cmd.highlight({ "StatusLineNC", "guifg=white" })
vim.cmd.highlight({ "StatusLineNC", "guibg=none" })
vim.cmd.highlight({ "Normal", "guibg=none" })
vim.cmd.highlight({ "Comment", "guifg=black" })
vim.cmd.highlight({ "LineNr", "guifg=black" })

-- vim.cmd('hi link Terminal Normal')
-- vim.cmd('hi link Terminal Comment')
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
