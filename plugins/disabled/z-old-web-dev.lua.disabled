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
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      -- Specific Language Server Configurations
      servers = {
        -- HTML
        html = {
          filetypes = { "html", "php", "javascript" },
          settings = {
            html = {
              suggest = {
                html5 = true,
              },
              format = {
                enable = true,
                wrapLineLength = 120,
                wrapAttributes = "auto",
              },
              autoClosingTags = true,
              completion = {
                attributeDefaultValue = "doublequotes",
              },
              validate = {
                scripts = true,
                styles = true,
              },
              hover = {
                documentation = true,
                references = true,
              },
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

        -- CSS
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

        -- Tailwind CSS
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
              experimental = {
                classRegex = {
                  "class:\\s*['\"]([^'\"]*)['\"]",
                  "tw\\.[^`]+`([^`]*)`",
                },
              },
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

        -- Emmet
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
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
                ["jsx.enabled"] = true,
                ["output.selfClosingStyle"] = "xhtml",
              },
            },
          },
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
            experimental = {
              useFlatConfig = false,
            },
          },
        },
      },
    },
  },

  -- Auto Tags (Updated Configuration)
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        autotag = {
          enable = true,
          enable_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "php",
          "xml",
          "markdown",
        },
      })
    end,
  },

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

  -- Treesitter Configuration
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
        "yaml",
        "markdown",
        "sql",
      },
      autotag = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Prettier Configuration
  {
    "prettier/vim-prettier",
    build = "npm install",
    ft = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "json",
      "graphql",
      "markdown",
      "vue",
      "svelte",
      "yaml",
      "html",
    },
    config = function()
      vim.g["prettier#autoformat"] = 1
      vim.g["prettier#autoformat_require_pragma"] = 0
      vim.g["prettier#config#single_quote"] = "true"
      vim.g["prettier#config#trailing_comma"] = "all"
    end,
  },

  -- Linting Configuration (Updated)
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

      vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
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
}
