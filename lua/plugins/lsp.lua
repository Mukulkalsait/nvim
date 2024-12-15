-- Additional LSP and Tooling Configuration for LazyVim

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Language Servers
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Additional LSP Support
      -- "hrsh7th/cmp-nvim-lsp",
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
        -- Web Development
        html = {
          filetypes = { "html", "php", "javascript" },
          settings = {
            html = {
              suggest = {
                html5 = true,
              },
            },
          },
        },
        cssls = {},
        tailwindcss = {
          filetypes = {
            "html",
            "php",
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
            },
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "php",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
        },
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          },
        },
        jsonls = {},
        yamlls = {},

        -- PHP
        intelephense = {
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
              },
              completion = {
                insertUseDeclaration = true,
              },
              diagnostics = {
                enable = true,
              },
            },
          },
        },

        -- Java
        -- jdtls = {
        --   settings = {
        --     java = {
        --       configuration = {
        --         runtimes = {
        --           {
        --             name = "JavaSE-17",
        --             path = "/usr/lib/jvm/java-17-openjdk/",
        --           },
        --         },
        --       },
        --     },
        --   },
        -- },

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
          },
        },

        -- Shell/Bash
        bashls = {},

        -- SQL
        sqlls = {},
      },

      -- Setup Handlers
      setup = {
        -- Custom setup for specific language servers
        -- jdtls = function(_, opts)
        --   vim.api.nvim_create_autocmd("FileType", {
        --     pattern = "java",
        --     callback = function()
        --       require("jdtls").start_or_attach(opts)
        --     end,
        --   })
        -- end,

        -- Tailwind CSS custom setup
        tailwindcss = function(_, opts)
          require("lspconfig").tailwindcss.setup(opts)
        end,
      },
    },

    -- -- LSP Configuration
    -- config = function(_, opts)
    --   local lspconfig = require("lspconfig")
    --   local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    --   -- Setup each language server
    --   for server, server_opts in pairs(opts.servers) do
    --     local merged_opts = vim.tbl_deep_extend("force", {
    --       capabilities = capabilities,
    --     }, server_opts)
    --
    --     lspconfig[server].setup(merged_opts)
    --   end
    --
    --   -- Diagnostic configuration
    --   vim.diagnostic.config(opts.diagnostics)
    -- end,
  },

  -- Prettier Configuration
  {
    "prettier/vim-prettier",
    build = "pnpm install",
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
      "php",
    },
    config = function()
      vim.g["prettier#autoformat"] = 1
      vim.g["prettier#autoformat_require_pragma"] = 0
      vim.g["prettier#config#single_quote"] = "true"
    end,
  },

  -- Debugging Configuration
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Adapter Configurations
      dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
      }

      -- dap.adapters.java = {
      --   type = "server",
      --   host = "127.0.0.1",
      --   port = 5005,
      -- }

      -- Launch Configurations
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }

      -- UI Configuration
      dapui.setup()

      -- DAP Events
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
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
        php = { "phpcs" },
        sql = { "sqlfluff" },
        yaml = { "yamllint" },
        json = { "jsonlint" },
      }

      -- Automatic linting on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
