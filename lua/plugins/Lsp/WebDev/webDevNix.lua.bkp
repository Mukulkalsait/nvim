return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
        severity_sort = true,
      },
      servers = {
        html = {
          filetypes = { "html", "php", "javascript" },
          settings = {
            html = {
              suggest = { html5 = true },
              format = {
                enable = true,
                wrapLineLength = 200,
                wrapAttributes = "auto",
              },
              autoClosingTags = true,
              completion = { attributeDefaultValue = "doublequotes" },
              validate = { scripts = true, styles = true },
              hover = { documentation = true, references = true },
            },
          },
          init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = { css = true, javascript = true },
            provideFormatter = true,
          },
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                duplicateProperties = "warning",
                unknownVendorSpecificProperties = "warning",
              },
            },
          },
        },
        tailwindcss = {
          filetypes = {
            "html", "php", "css", "javascript",
            "javascriptreact", "typescript", "typescriptreact",
          },
          settings = {
            tailwindCSS = {
              validate = true,
              lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
              },
            },
          },
        },
        emmet_ls = {
          filetypes = {
            "html", "php", "css", "scss", "javascript",
            "javascriptreact", "typescript", "typescriptreact",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
                ["jsx.enabled"] = true,
                ["output.selfClosingStyle"] = "xhtml",
              },
            },
          },
        },({})
        rst_lsp = {
          settings = {
            rst = { validate = true, lint = { enabled = true } },
          },
        },
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
            validate = "on",
            packageManager = "npm",
            experimental = { useFlatConfig = false },
          },
        },
      },
    },
  },

  -- Auto Tags
  { "windwp/nvim-ts-autotag", event = "InsertEnter", config = true },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = true,
      ignored_next_char = "[%w%.]",
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        typescript = { "template_string" },
      },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html", "css", "javascript", "typescript", "tsx", "php",
        "json", "yaml", "markdown", "sql", "rst",
      },
      autotag = { enable = true },
      indent = { enable = true },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },

  -- Lint
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        css = { "stylelint" },
        php = { "phpcs" },
        rst = { "rstcheck" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },

  -- Trouble
  { "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" }, opts = { use_diagnostic_signs = true } },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        "css", "scss", "html", "javascript", "typescript",
      })
    end,
  },
({})({})({})
  -- Mason (disabled installs, just PATH helper)
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "prepend",
      ensure_installed = {},
      automatic_installation = false,
    },
  },

  -- Conform (PHP formatter)
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
