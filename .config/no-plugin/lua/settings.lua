vim.g.netrw_banner = 0
vim.opt.belloff = 'copy'
vim.opt.cdhome = true
vim.opt.cindent = false -- test this could be useful
vim.opt.cinoptions = 'eN' -- not sure how it works
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.errorbells = true
vim.opt.expandtab = true                -- use 'CTRL-V<Tab>' to insert real tab when true
-- vim.opt.foldcolumn = 'auto'
vim.opt.foldenable = true
vim.opt.hlsearch = true
vim.opt.icon = true
vim.opt.iconstring = '😀'
vim.opt.keywordprg = ':Man'
-- vim.opt.loadplugins = false          -- this disables netrw
vim.opt.mouse = 'n'
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.pumblend = 0                    -- pupup-menu transparency
vim.opt.pumwidth = 15
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4                  -- number of spaces used in <Tab>
vim.opt.showtabline = 2                 -- display tab
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'auto'             -- a way to resize lsp sign column "auto:[1-2]"

vim.opt.visualbell = true

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>gc', vim.lsp.get_clients)
vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
-- vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>e', vim.cmd.Explore)
-- vim.keymap.set('i', '<C-C>', '<Esc>') -- solve issue in diagnostic when using CTRL+C
-- -- vim.keymap.del('n', 'gl', {buffer=true})
-- vim.keymap.set('n', '<leader>gc', vim.lsp.get_clients)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") --moving selected lines
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") --moving selected lines
vim.keymap.set('n', '<leader>pc', ':echo stdpath("config")') --printing config location
