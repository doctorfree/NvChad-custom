local M = {}

  -- lsp servers to install
M.lsp_servers = {
  "bashls",
  "cssmodules_ls",
  "denols",
  "dockerls",
  "eslint",
  "gopls",
  "graphql",
  "html",
  "jsonls",
  "julials",
  "ltex",
  "lua_ls",
  "marksman",
  "pylsp",
  "pyright",
  "sqlls",
  "tailwindcss",
  "terraformls",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

-- Formatters and linters installed by Mason
M.formatters_linters = {
  "actionlint",
  "goimports",
  "gofumpt",
  "golangci-lint",
  "google-java-format",
  "latexindent",
  "markdownlint",
  "prettier",
  "sql-formatter",
  "shellcheck",
  "shfmt",
  "stylua",
  "tflint",
  "yamllint",
}

M.mason = {
  ensure_installed = {},

  PATH = "prepend",

  ui = {
    check_outdated_packages_on_open = true,
    border = "single",
    width = 0.8,
    height = 0.9,
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

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
