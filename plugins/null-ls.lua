local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	-- Go
	b.formatting.gofumpt,
	b.formatting.golines,
	b.formatting.goimports,
	b.diagnostics.golangci_lint.with {
		args = {
			"run",
			"--fix=false",
			"--out-format=json",
			"$DIRNAME",
			"--path-prefix",
			"$ROOT",
		},
	},
	b.diagnostics.revive,

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck,

	-- Meta formatters
	b.formatting.prettierd.with {
		filetypes = { "html", "yaml", "javascript", "typescript" },
	},
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method "textDocument/formatting" then
		vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format { bufnr = bufnr }
			end,
		})
	end
end

null_ls.setup {
	debug = false,
	sources = sources,
	on_attach = on_attach,
}
