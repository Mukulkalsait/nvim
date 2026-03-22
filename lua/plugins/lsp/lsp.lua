return {
  -- LSP Configuration (no Mason on NixOS!)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "folke/neodev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Global diagnostic display settings (fixes missing warnings/errors in Rust/JS/TS)
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
        severity_sort = true,
      })

      -- Setup LSP servers (installed via Nix)
      local servers = {
        html = {
          filetypes = { "html", "php" },
          settings = {
            html = {
              suggest = { html5 = true },
              format = {
                enable = true,
                wrapLineLength = 250,
                wrapAttributes = "auto",
              },
              autoClosingTags = true,
            },
          },
        },
        cssls = {},
        tailwindcss = {
          filetypes = { "html", "php", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
        emmet_ls = {
          filetypes = { "html", "php", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
        vtsls = {
          cmd = { "typescript-language-server", "--stdio" },  -- Fix: Use correct Nix binary name
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "jsx", "tsx" },
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
              },
            },
          },
        },
        eslint = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        nil_ls = {}, -- Nix LSP
        phpactor = {  -- For PHP completion/hover
          filetypes = { "php" },
        },
        jsonls = {},  -- For JSON
        sqls = {
          cmd = { "sqls" },  -- Explicit cmd for stability
          on_attach = function(client, bufnr)
            -- Optional: Add logging or error handling
            print("sqls attached to buffer " .. bufnr)
          end,
          settings = {
            sqls = {
              connections = {  -- Edit with real DB (required for full features)
                {
                  driver = "sqlite3",  -- Or 'mysql', 'postgresql'
                  dataSourceName = "/path/to/your/database.sqlite",  -- Example for SQLite
                },
              },
            },
          },
        },  -- For SQL
        dockerls = {},  -- For Dockerfiles
        yaml_ls = {  -- For YAML/Kubernetes
          settings = {
            yaml = {
              schemas = {
                ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = {
                  "kubernetes/*.yaml", "*.k8s.yaml", -- Adjust patterns as needed
                },
              },
            },
          },
        },
        bashls = {},  -- For Bash/ZSH (.sh, .bash, .zsh)
      }

      for server, config in pairs(servers) do
        lspconfig[server].setup(config)
      end
    end,
  },
}
