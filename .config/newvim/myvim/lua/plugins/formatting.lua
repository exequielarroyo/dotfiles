return {
	'stevearc/conform.nvim',
	config = function()
		local conform = require('conform');

		conform.setup({
			formatters_by_ft = {
				blade = { 'blade-formatter', 'tlint', 'prettier', },
				php = { 'blade-formatter', 'tlint', 'prettier', },
				html = { 'ast-grep', 'prettier', 'prettierd', },
				lua = { 'stylua' },
			}
		});

		vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
			conform.format()
		end);
	end,
}
