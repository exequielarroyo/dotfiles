-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
	    "ThePrimeagen/harpoon",
	    branch = "harpoon2",
	    dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
	    "neovim/nvim-lspconfig",
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), {title=""}) end)

-- initialization
vim.opt.runtimepath:append("~/")
vim.cmd.colorscheme("exequiel")
vim.opt.cursorline = true

-- lsp
  vim.lsp.config('lua_ls', {
	  cmd = { "C:/Users/exequiel.arroyo/Downloads/lua-language-server-3.15.0-win32-x64/bin/lua-language-server.exe" },
	  settings = {
		  Lua = {
			  workspace = {
				  -- library = vim.api.nvim_get_runtime_file("", true)
			  },
			  -- telemetry = {
			  --  enable = true
			  -- }
		  }
	  },
  })
  vim.lsp.enable('lua_ls')

  vim.lsp.config('omnisharp', {
	  cmd = { "C:/Users/exequiel.arroyo/Downloads/omnisharp-win-x64/OmniSharp.exe", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" },
  })
  vim.lsp.enable('omnisharp')

-- diagnostics
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*:n",
  callback = function()
    vim.diagnostic.show(nil, 0)
  end,
})

-- callback callback = 2
-- end
-- local s = 3
-- vim.asdffd(Error)
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '❌',
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
})
-- vim.keymap.set('i', '<C-C>', '<Esc>') -- solve issue in diagnostic when using CTRL+C
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
