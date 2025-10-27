return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    opts = {
      -- Global LSP Settings
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 2,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      -- Specific Language Server Configurations
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
                preserveNewLines = true,
                indentInnerHtml = true,
              },
              autoClosingTags = true,
              -- completion = {
              --   attributeDefaultValue = "doublequotes", --G: i think this might be the problem.
              -- },
              validate = {
                scripts = true,
                styles = true,
              },
              hover = {
                documentation = true,
                references = true,
              },
              -- Add Bootstrap specific settings
              -- customData = {
              --   {
              --     name = "bootstrap5",
              --     description = "Bootstrap 5 Custom Data",
              --     version = "5.0",
              --     globalAttributes = {
              --       ["class"] = {
              --         values = {
              --           "container",
              --           "container-fluid",
              --           "row",
              --           "col",
              --           "btn",
              --           "btn-primary",
              --           "btn-secondary",
              --           "btn-success",
              --           "alert",
              --           "alert-primary",
              --           "card",
              --           "card-body",
              --           "form-control",
              --           "table",
              --           "table-striped",
              --           "d-flex",
              --           "justify-content-between",
              --           "align-items-center",
              --           "mt-3",
              --           "mb-3",
              --           "p-3",
              --         },
              --       },
              --     },
              --   },
              -- },
            },
          },
          init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
              css = true,
              javascript = true,
            },
            provideFormatter = true,
          },
        },

        --css
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

        --tilwindcss
        tailwindcss = {
          filetypes = {
            "html",
            "php",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          settings = {
            tailwindCSS = {
              -- experimental = {    --Y: or this might be the problem.
              --   classRegex = {
              --     "class:\\s*['\"]([^'\"]*)['\"]",
              --     "tw\\.[^`]+`([^`]*)`",
              --   },
              -- },
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

        --emmit
        emmet_ls = {
          filetypes = {
            "html",
            "php",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          -- init_options = {   --  Y: options for initilazion may be.
          --   html = {
          --     options = {
          --       ["bem.enabled"] = true,
          --       ["jsx.enabled"] = true,
          --       ["output.selfClosingStyle"] = "xhtml",
          --     },
          --   },
          -- },
        },
        -- JavaScript/TypeScript
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
          },
        },

        -- ESLint
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
            validate = "on",
            packageManager = "npm",
          },
        },
      },
    },
  },

  -- Auto Tags
  -- In webdev.lua, update the autotag section:
  -- Auto Tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup() -- Use default configuration
    end,
  },

  -- Auto Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = true,
      check_ts = true,
    },
  },

  -- Treesitter Configuration
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "json",
        "yaml",
        "markdown",
        "sql",
      })

      -- Additional configuration
      opts.autotag = { enable = true }
      opts.indent = { enable = true }
      opts.highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }

      return opts
    end,
  },

  -- Linting Configuration
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        css = { "stylelint" },
        php = { "phpcs" },
      }

      -- Trigger lint on write and change
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  -- Additional Web Development Tools
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
    },
  },

  -- Color highlighting in CSS/HTML
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      })
    end,
  },

  -- Ensure Mason installs all needed tools
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
        "php-cs-fixer",
        "phpcs",
      })
      return opts
    end,
  },
}
