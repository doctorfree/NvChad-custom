local overrides = require "custom.plugins.overrides"

return {
	["folke/which-key.nvim"] = {
		disable = false,
		config = function()
			local wk = require "which-key"
			wk.setup {
				window = {
					position = "bottom",
					border = "none",
					padding = { 0, 0, 0, 0 },
					margin = { 0, 0, 0, 0 },
				},
				layout = {
					align = "center",
				},
			}
		end,
	},

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["nvim-treesitter/nvim-treesitter-textobjects"] = {
		after = "nvim-treesitter",
		setup = function()
			require("nvim-treesitter.configs").setup {
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true of false
						include_surrounding_whitespace = true,
					},
				},
			}
		end,
	},

	["ahmedkhalf/project.nvim"] = {
		after = "telescope.nvim",
		config = function()
			require("project_nvim").setup {}
			local t = require "telescope"
			t.load_extension "projects"
		end,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	["neovim/nvim-lspconfig"] = {
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.plugins.lspconfig"
		end,
	},

	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require "custom.plugins.null-ls"
		end,
	},

	["phaazon/hop.nvim"] = {
		branch = "v2",
		config = function()
			require("hop").setup()
		end,
	},

	["folke/trouble.nvim"] = {
		requires = {
			"kyazdani42/nvim-web-devicons",
			config = function()
				require "custom.plugins.trouble"
			end,
		},
	},

	-- color scheme
	["folke/tokyonight.nvim"] = {
		-- commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764",
		event = "BufWinEnter",
		config = function()
			require "custom.plugins.tokyonight"
			-- vim.cmd [[colorscheme tokyonight-night]]
		end,
	},

	-- Dasboard
	["goolord/alpha-nvim"] = {
		-- after = "base46",
		disable = false,
		config = function()
			require "custom.plugins.alpha"
		end,
	},
}
