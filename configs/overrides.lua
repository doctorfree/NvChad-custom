local M = {}

M.treesitter = {
	ensure_installed = {
		"bash",
		"c",
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
