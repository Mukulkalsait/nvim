return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- Y: Only load when actually editing files :speedIncrease
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    opts = {
      -- IMP: Global LSP Settings
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
      -- R: Specific Language Server Configurations
      servers = {
        -- B:HTML (with Bootstrap support)
        html = {
          filetypes = { "html", "php", "javascript" },
          settings = {
            html = {
              suggest = {
                html5 = true,
              },
              format = {
                enable = true,
                wrapLineLength = 200,
                wrapAttributes = "auto",
                -- preserveNewLines = true,
                -- indentInnerHtml = true,
              },
              autoClosingTags = true,
              completion = {
                attributeDefaultValue = "doublequotes", --G: i think this might be the problem.
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
        -- B:CSS
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
        -- B:Tailwind CSS
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
        -- B:Emmet
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
        -- B:JavaScript/TypeScript
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all" }, --Y: Reduced from "all" to "literals"
                parameterTypes = { enabled = true }, --  Can be disabled for :SpeedIncrease
                variableTypes = { enabled = true }, -- same
                propertyDeclarationTypes = { enabled = true }, -- same
                functionLikeReturnTypes = { enabled = true },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "all" }, --Y: Reduced from "all" to "literals"
                parameterTypes = { enabled = true }, -- Can be disalbed for :SpeedIncrease
                variableTypes = { enabled = true }, -- same
                propertyDeclarationTypes = { enabled = true }, -- same
                functionLikeReturnTypes = { enabled = true },
              },
            },
          },
        },
        -- B:ESLint
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

  -- R:Auto Tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup() -- Use default configuration
    end,
  },

  -- R:Auto Pairs
  -- Y: detaild config.
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
      -- fast_wrap = false, -- Y: can be -> Disabled for performance :SpeedIncrease
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
  -- R:Treesitter Configuration
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
      incremental_selection = { -- Y: for better speed.
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
  -- R: Linting Configuration
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost", -- Y: for  berrer performance only evoke on save not on textchange
    -- event = "VeryLazy",   -- for
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
      -- Y: for  berrer performance only evoke on save not on textchange
      -- vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  -- R:Additional Web Development Tools
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" }, -- Y: Only load when explicitly called
    opts = {
      use_diagnostic_signs = true,
    },
  },
  -- R:Color highlighting in CSS/HTML
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" }, -- Y: can be removed if we want it allways on.
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        -- "javascriptreact",   -- Y: only on when we need REACT.
        -- "typescriptreact",   -- same.
      })
    end,
  },
  -- R:Ensure Mason installs all needed tools
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

  -- R: To format the PHP With HTML files.
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Y:Only load when saving files
    opts = {
      formatters_by_ft = {
        php = { "blade-formatter" },
        -- Y: pnpm add -g blade-formatter
        -- MAKE SURE TO INSTALL
        -- this will format both html and php files at same time
      },
    },
  },
}
