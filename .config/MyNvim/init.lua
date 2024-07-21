-- vim.g.netrw_banner = 0
vim.g.mapleader = ' '
vim.opt.background = "dark"
vim.opt.confirm = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.fixendofline = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
--vim.opt.title = true
--vim.opt.titlestring = "sample title"
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") --moving selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") --moving selected lines

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
	{ 'VonHeikemen/lsp-zero.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	{ 'Mofiqul/vscode.nvim' },
	-- { 'tpope/vim-commentary' },
	-- { 'numToStr/Comment.nvim' },
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'EdenEast/nightfox.nvim' },
	{ 'lewis6991/gitsigns.nvim' },
	{ 'folke/tokyonight.nvim' },
	{ 'scottmckendry/cyberdream.nvim' },
	{ 'kepano/flexoki-neovim' },
	{ 'nyoom-engineering/oxocarbon.nvim' },
	-- { 'hardhackerlabs/theme-vim' },
	{ 'savq/melange-nvim' },

	{ 'windwp/nvim-ts-autotag' },
	{ 'windwp/nvim-autopairs' },

	{ 'nvim-lua/plenary.nvim' }, -- dependencies of harpoon, fugitive, telescope
	{ 'tpope/vim-fugitive' },
	{ 'ThePrimeagen/harpoon' },
	{ 'nvim-telescope/telescope.nvim' },

	{ 'mbbill/undotree' },

	{ 'mfussenegger/nvim-dap' },
	{ 'rcarriga/nvim-dap-ui' },
	{ 'nvim-neotest/nvim-nio' },

	{ 'nvim-lualine/lualine.nvim' },
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'folke/todo-comments.nvim' },
	{ 'norcalli/nvim-colorizer.lua' },

	{ 'rafamadriz/friendly-snippets' },

	{ 'nvim-neorg/neorg' },
}

require("lazy").setup(plugins, opts)
require("cmp").setup{
    sources = require("cmp").config.sources(
    {{ name = "nvim_lsp" },{ name = "luasnip" }},
    {{ name = "buffer" }}
    )
}
require("luasnip.loaders.from_vscode").lazy_load()
require("todo-comments").setup{}
require "colorizer".setup()
require("lualine").setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.continue, {})
dap.adapters.coreclr = {
  type = 'executable',
  command = 'C:\\Users\\exequielarroyo\\Downloads\\Compressed\\netcoredbg-win64\\netcoredbg\\netcoredbg.exe',
  args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/webapi/bin/Debug/net8.0/', 'file')
    end,
  },
}
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require('neorg').setup()

local lsp_zero = require('lsp-zero')
lsp_zero.set_sign_icons({
    error = "😡",
    warn = "😩",
    hint = "🤓",
    info = "😎",
})
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  local opts = {buffer = bufnr}
  -- vim.keymap.set('n', 'lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- more code  ...
end)
require("mason").setup()
require("mason-lspconfig").setup()
-- require('Comment').setup()
-- require('gitsigns').setup()
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>hb', function() gitsigns.blame_line{} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
require('nvim-autopairs').setup()
require('nvim-ts-autotag').setup()
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)

require("lspconfig").lua_ls.setup{}
require("lspconfig").tailwindcss.setup{}
require("lspconfig").angularls.setup{}
require("lspconfig").tsserver.setup{}
require("lspconfig").jsonls.setup{}
require("lspconfig").intelephense.setup{}
require("lspconfig").html.setup{}
require("lspconfig").csharp_ls.setup{}
require("lspconfig").somesass_ls.setup{}
require("lspconfig").stimulus_ls.setup{}

require("cyberdream").setup({
    transparent = true,
})
require("vscode").setup({
	transparent = true,
})
require("nightfox").setup({
    options = {
	transparent = true,
    },
})
require("tokyonight").setup({
    transparent = true,
})

vim.opt.background = "dark"
-- vim.cmd.colorscheme "vscode"
-- vim.cmd.colorscheme "dawnfox"
vim.cmd.colorscheme "cyberdream"
-- vim.cmd.colorscheme "melange"
-- vim.cmd.colorscheme "oxocarbon"

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNR", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Search", { bg = "none" })
