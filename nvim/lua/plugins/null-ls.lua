return {
	"jose-elias-alvarez/null-ls.nvim",
	name = "null-ls",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local sources = {
			formatting.eslint, -- Javascript, React
			formatting.stylua, -- Lua
			formatting.uncrustify, -- c, cpp, cs, java
			formatting.yapf, -- Python
        }
		null_ls.setup({
			sources = sources,
			-- Format code on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
