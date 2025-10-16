-- BOOTSTRAP LAZY.NVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- SETUP LAZY.NVIM
require("lazy").setup({
	spec = {
		-- add your plugins here
		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
			config = function()
				local harpoon = require("harpoon")
				harpoon:setup()
				vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
				vim.keymap.set("n", "<C-e>",
				function() harpoon.ui:toggle_quick_menu(harpoon:list(), { title = "", border = "solid" }) end)
				vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
				vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
			end,
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{
					"folke/lazydev.nvim",
					ft = "lua", -- only load on lua files
					opts = {
						library = {
							-- See the configuration section for more details
							-- Load luvit types when the `vim.uv` word is found
							{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
						},
					},
				},
				{
					'saghen/blink.cmp',
					opts = {
						keymap = { preset = 'default' },
						appearance = {
							-- user_nvim_cmp_as_default = true,
							-- nerd_font_variant = 'mono',
						},
						signature = { enabled = true },
						completion = {
							menu = {
								border = "solid", -- https://github.com/Saghen/blink.cmp/discussions/620
								draw = {
									-- columns = {
									-- 	{ "label", "label_description", gap = 1 },
									-- 	{ "kind" }
									-- }
								}
							}
						},
						fuzzy = {
							implementation = "lua"
						},
					},
				},
			},
			config = function()
				vim.lsp.config('lua_ls', { cmd = { "C:/Users/exequ/Downloads/Compressed/lua-language-server-3.15.0-win32-x64/bin/lua-language-server.exe" }, })
				vim.lsp.enable('lua_ls')
				vim.lsp.config('omnisharp', { cmd = { "C:/Users/exequ/Downloads/Compressed/omnisharp-win-x64/OmniSharp.exe", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }, })
				vim.lsp.enable('omnisharp')
				vim.lsp.config('tailwindcss', { cmd = { 'node.exe', 'C:/Users/exequ/source/repos/tailwindcss-intellisense/packages/tailwindcss-language-server/bin/tailwindcss-language-server', '--stdio' } })
				vim.lsp.enable('tailwindcss')
				vim.lsp.config('eslint', { cmd = { 'node.exe', 'C:/Users/exequ/source/repos/vscode-langservers-extracted/bin/vscode-eslint-language-server', '--stdio' } })
				vim.lsp.enable('eslint')
				-- vim.lsp.config('cssls', { cmd = { 'node.exe', 'C:/Users/exequ/source/repos/vscode-langservers-extracted/bin/vscode-css-language-server', '--stdio' } })
				vim.lsp.config('cssls', { cmd = { 'C:/nvm4w/nodejs/vscode-css-language-server.cmd', '--stdio' } }) -- path is not registered in nvim path's
				vim.lsp.enable('cssls')
				vim.lsp.config('ts_ls', { cmd = { 'node.exe', 'C:/Users/exequ/source/repos/typescript-language-server/lib/cli.mjs', '--stdio' } })
				vim.lsp.enable('ts_ls')
				vim.lsp.config('vue_ls', { cmd = { 'node.exe', 'C:/Users/exequ/source/repos/language-tools/packages/language-server/bin/vue-language-server.js', '--stdio' } })
				vim.lsp.enable('vue_ls')
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},
		{
			"scottmckendry/cyberdream.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				require("cyberdream").setup({
					-- Set light or dark variant
					variant = "light", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

					-- Enable transparent background
					transparent = true,
				})
				vim.cmd.colorscheme("cyberdream")
			end,
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "exequiel" } },
	-- automatically check for plugin updates
	-- checker = { enabled = true },
})

vim.opt.runtimepath:append("~/")
-- vim.cmd.colorscheme("exequiel")

-- OPTIONS
vim.opt.belloff = 'all'
vim.opt.breakindent = true
vim.opt.breakindentopt = ''
vim.opt.cursorline = true
-- vim.opt.expandtab = false
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 4
-- vim.opt.statusline = "%f"
vim.opt.tabstop = 4
-- vim.opt.winbar = ""
vim.opt.winborder = "solid"
vim.opt.wrap = false

-- DIAGNOSTICS
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	pattern = "*:n",
-- 	callback = function()
-- 		vim.diagnostic.show(nil, 0)
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     vim.diagnostic.disable(0)
--   end,
-- })
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	pattern = "*:n",
-- 	callback = function(args)
-- 		print("Mode changed: " .. args.match) -- debug
-- 		vim.diagnostic.enable(0)
-- 		vim.diagnostic.show(nil, 0)
-- 	end,
-- })

-- callback callback = 2
-- end
-- local s = 3
-- vim.asdffd(Error)
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '💢',
			[vim.diagnostic.severity.WARN] = '⚠️',
			[vim.diagnostic.severity.INFO] = 'ℹ️',
			[vim.diagnostic.severity.HINT] = '⚡',
		},
		-- linehl = {
		-- 	[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
		-- },
		-- numhl = {
		-- 	[vim.diagnostic.severity.WARN] = 'WarningMsg',
		-- },
	},
	float = {
		border = "solid",
		-- title = "Diagnostic",
	},
})
-- vim.keymap.set('i', '<C-C>', '<Esc>') -- solve issue in diagnostic when using CTRL+C
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "markdown" then
      vim.opt.wrap = true
    else
      vim.opt.wrap = false
    end
  end,
})

local hello = 1
print(hello)

