local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "gopls", "sqls", "tsserver" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = function(client, bufnr)
			vim.diagnostic.config { underline = false }

			on_attach(client, bufnr)
		end,
		capabilities = capabilities,
	}
end
