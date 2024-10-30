-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	-- signs = false,
-- 	update_in_insert = false, -- here
-- 	underline = true,
-- 	severity_sort = false,
-- 	float = true,
-- })

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

local pid = vim.fn.getpid()

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'lua',
      callback = function(ev)
        vim.lsp.start({
          name = 'lua-language-server',
          cmd = {"C:/Users/exequielarroyo/Downloads/lua-language-server-3.11.1-win32-x64/bin/lua-language-server.exe"},
          root_dir = vim.fs.root(ev.buf, {'init.lua',}),
	  settings = {
		  Lua = {
			  workspace = {
				  library = vim.api.nvim_get_runtime_file("", true)
			  },
			  telemetry = {
				  enable = true
			  }
		  }
	  },
        })
      end,
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'cs',
      callback = function(ev)
        vim.lsp.start({
          name = 'omnisharp',
          cmd = {"C:/Users/exequielarroyo/Downloads/omnisharp-win-x64/OmniSharp.exe", "--languageserver", "--hostPID", tostring(pid)},
	  root_dir = vim.fs.root(ev.buf, function(name, path)
		  return name:match('%.sln$') ~= nil
	  end),
        })
      end,
    })
