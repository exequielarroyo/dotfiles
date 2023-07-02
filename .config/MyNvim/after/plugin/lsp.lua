local lsp = require('lsp-zero').preset({
    set_lsp_keymaps = true,
    sign_icons = {
        error = 'what',
        warn = 'what',
        hint = 'what',
        info = 'what'
    }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
