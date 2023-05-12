local overrides = require("custom.configs.overrides")
local lsp_on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

--- @param on_attach fun(client, buffer)
local navic_on_attach = function(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require "plugins.configs.cmp"
      require "custom.configs.nvim-cmp"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "nvim-lua/plenary.nvim",
      "b0o/schemastore.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      local opts = {
        ensure_installed = overrides.formatters_linters,
        ui = {
          border = "rounded",
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ﮊ",
          },
        },
      }
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function install_ensured()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(install_ensured)
      else
        install_ensured()
      end
      require("mason-lspconfig").setup({
        ensure_installed = overrides.lsp_servers,
        automatic_installation = true,
      })
      require("mason-lspconfig").setup_handlers({
        -- Default setup for all servers, unless a custom one is defined below
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = function(client, bufnr)
              lsp_on_attach(client, bufnr)
            end,
            capabilities = capabilities,
          })
        end,
        -- custom setup for a server goes after the function above
        -- Example, override rust_analyzer
        -- ["rust_analyzer"] = function ()
        --   require("rust-tools").setup {}
        -- end,
        ["clangd"] = function()
          lspconfig.clangd.setup({
            cmd = {
              "clangd",
              "--offset-encoding=utf-16", -- To match null-ls
              --  With this, you can configure server with
              --    - .clangd files
              --    - global clangd/config.yaml files
              --  Read the `--enable-config` option in `clangd --help` for more information
              "--enable-config",
            },
            on_attach = function(client, bufnr)
              lsp_on_attach(client, bufnr)
            end,
            capabilities = capabilities,
          })
        end,

        -- Example: disable auto configuring an LSP
        -- Here, we disable lua_ls so we can use NvChad's default config
        ["lua_ls"] = function() end,
      })
      require("custom.configs.lspconfig")
    end,
  },

  {
    "folke/neodev.nvim",
    version = false, -- last release is way too old
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("custom.configs.neodev")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason.nvim",
    },
    config = function()
      vim.filetype.add({
        extension = {
          zsh = "zsh",
        },
      })
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local actions = null_ls.builtins.code_actions
      null_ls.setup({
        debug = false,
        sources = {
          formatting.prettier.with({
            -- milliseconds
            timeout = 10000,
            extra_args = { "--single-quote", "false" },
          }),
          formatting.stylua.with({
            timeout = 10000,
            extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          }),
          formatting.terraform_fmt,
          formatting.goimports,
          formatting.gofumpt,
          formatting.latexindent.with({
            timeout = 10000,
            extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
          }),
          actions.shellcheck,
          actions.gitsigns,
          formatting.shfmt.with({
            extra_args = { "-i", "2", "-ci", "-bn" },
            filetypes = { "sh", "zsh", "bash" },
          }),
          diagnostics.ruff,
          formatting.google_java_format,
          formatting.black.with({
            timeout = 10000,
            extra_args = { "--fast" },
          }),
          formatting.sql_formatter.with({
            timeout = 10000,
            extra_args = { "--config" },
          }),
          formatting.markdownlint,
          formatting.beautysh.with({
            timeout = 10000,
            extra_args = { "--indent-size", "2" },
          }),
          diagnostics.zsh.with({
            filetypes = { "zsh" },
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonInstallAll",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog"
    },
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- Install a plugin

  -- lsp symbol navigation
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      navic_on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 0,
        depth_limit_indicator = "..",
        icons = require("custom.icons").kinds,
      }
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  },

  -- { import = "custom.configs.extras.copilot" },
  { import = "custom.configs.extras.diffview" },
  -- { import = "custom.configs.extras.mason-extras" },
  { import = "custom.configs.extras.symbols-outline" },
  { import = "custom.configs.extras.trouble" },
}

return plugins
