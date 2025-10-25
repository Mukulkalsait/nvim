return {
  -- LSP Configuration with more conservative settings
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Y: Only load when actually editing files :speedIncrease
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    opts = {
      -- Global LSP Settings - Simple, conservative settings
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
        severity_sort = true,
      },
      -- Simplified server configurations
      servers = {
        html = {}, -- Use default settings
        cssls = {}, -- Use default settings
        tailwindcss = {}, -- Use default settings
        emmet_ls = {}, -- Use default settings
        vtsls = {
          -- Minimal TypeScript settings
          settings = {
            javascript = {
              inlayHints = { enabled = false }, -- Disable inlay hints for performance
            },
            typescript = {
              inlayHints = { enabled = false }, -- Disable inlay hints for performance
            },
          },
        },
        eslint = {}, -- Use default settings
      },
    },
  },

  -- Other plugins with minimal configuration
  { "windwp/nvim-ts-autotag", event = "InsertEnter" },
  { "windwp/nvim-autopairs", event = "InsertEnter" },

  -- Treesitter with minimal config
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "json",
      },
    },
  },

  -- Minimal linting config
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        css = { "stylelint" },
        php = { "phpcs" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Other plugins with minimal config
  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" } },
  { "norcalli/nvim-colorizer.lua" },

  -- Mason with basic tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "eslint-lsp",
        "stylelint-lsp",
        "phpcs",
      })
      return opts
    end,
  },

  -- Simple formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        php = { "blade-formatter" },
      },
    },
  },
}
