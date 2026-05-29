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

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
        severity_sort = true,
      })

      local servers = {
        -- RUST ANALYZER (critical for Rust development)
        -- rust_analyzer = {
        --   cmd = { "rust-analyzer" },
        --   filetypes = { "rust" },
        --   settings = {
        --     ["rust-analyzer"] = {
        --       -- Your custom Rust formatting settings
        --       cargo = {
        --         allFeatures = true,
        --         loadOutDirsFromCheck = true,
        --         runBuildScripts = true,
        --       },
        --       procMacro = {
        --         enable = true,
        --       },
        --       checkOnSave = {
        --         command = "clippy", -- Use clippy on save
        --       },
        --       -- IMPORTANT: Rust formatting settings
        --       rustfmt = {
        --         extraArgs = { "+nightly" }, -- if you use nightly features
        --         overrideCommand = nil, -- use default rustfmt
        --       },
        --     },
        --   },
        -- },

        vtsls = {
          cmd = { "vtsls", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "jsx", "tsx" },
        },

        bashls = {
          cmd = { "bash-language-server", "start" },
          filetypes = { "sh", "bash", "zsh" },
        },

        html = { cmd = { "vscode-html-language-server", "--stdio" } },
        cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
        jsonls = { cmd = { "vscode-json-language-server", "--stdio" } },

        yamlls = {
          cmd = { "yaml-language-server", "--stdio" },
          filetypes = { "yaml", "yml" },
        },
        dockerls = {
          cmd = { "docker-langserver", "--stdio" }, -- ✅ Use this binary name
          filetypes = { "dockerfile" },
        },

        docker_compose_language_service = {
          cmd = { "docker-compose-langserver", "--stdio" },
          filetypes = { "dockerfile" }, --# Also works for docker-compose.yml
          -- filetypes = { "dockerfile", "yaml" }, --# Also works for docker-compose.yml
        },

        lua_ls = {
          cmd = { "lua-language-server" },
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

        nixd = {
          cmd = { "nixd" },
          filetypes = { "nix" },
        },

        tailwindcss = {
          cmd = { "tailwindcss-language-server", "--stdio" },
          filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        },

        emmet_ls = {
          cmd = { "emmet-language-server", "--stdio" },
          filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        },
      }

      for server, config in pairs(servers) do
        pcall(function()
          lspconfig[server].setup(config)
        end)
      end
    end,
  },
}
