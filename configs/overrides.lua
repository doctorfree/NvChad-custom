local M = {}

M.mason = {
	ensure_installed = {
		-- Lua
		"lua-language-server",
		"luacheck",
		"stylua",

		-- Go
		"gopls",
		"golangci-lint",
		"delve",
		"gofumpt",
		"goimports",
		"golines",
		"gotests",
		"gomodifytags",
		"iferr",
		"json-to-struct",
		"revive",

		-- SQL
		"sqls",
		"sqlfluff",
		"sql-formatter",

		-- JavaScript/Typescript
		"typescript-language-server",
		"prettierd",
		"eslint_d",

		-- Rust
		"rust-analyzer",
		"rustfmt",

		-- File Formats
		"json-lsp",
		"jsonlint",
		"jq",
		"yaml-language-server",
		"yamllint",
		"yamlfmt",

		-- Git
		"commitlint",
		"gitlint",

		-- Writing
		"marksman",
		"markdownlint",
		"vale",
		"write-good",
		"cspell",
		"misspell",
		"proselint",

		-- Shell
		"bash-language-server",
		"beautysh",
		"shfmt",
		"shellcheck",
		"shellharden",

		-- Others
		"ansible-language-server",
		"css-lsp",
		"codespell",
		"dockerfile-language-server",
		"dot-language-server",
		"editorconfig-checker",
		"html-lsp",
	},
}

M.treesitter = {
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"cpp",
		"cmake",
		"cpp",
		"css",
		"dockerfile",
		"dot",
		"elvish",
		"fish",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"godot_resource",
		"gomod",
		"gowork",
		"html",
		"http",
		"java",
		"javascript",
		"jq",
		"json",
		"json5",
		"jsonc",
		"julia",
		"kotlin",
		"latex",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"mermaid",
		"meson",
		"ninja",
		"nix",
		"org",
		"python",
		"regex",
		"rust",
		"sql",
		"svelte",
		"sxhkdrc",
		"todotxt",
		"toml",
		"typescript",
		"vim",
		"yaml",
		"zig",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
