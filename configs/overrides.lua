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

M.nvterm = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.85,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = true,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

return M
