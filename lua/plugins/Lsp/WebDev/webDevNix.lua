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
        -- Y:RUST IS WORKING
        rust_analyzer = {  -- Consolidated settings (remove duplicates)
          cmd = { "rust-analyzer" },  -- Use the standard one
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                buildScripts = { enable = true },
                loadOutDirsFromCheck = true,
              },
              check = {
                command = "check",
                -- command = "clippy",
                extraArgs = { "--no-deps" },
              },
              checkOnSave = true,
              diagnostics = { enable = true },
              files = {
                excludeDirs = { ".direnv", ".git", ".github", ".gitlab", "bin", "node_modules", "target", "venv", ".venv" }
              },
              procMacro = { enable = true },
            },
          },
        },
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

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = true,
      check_ts = true,
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
      },
    },
  },

  -- TreeSitter (parsers installed via Nix)
  {
    "nvim-treesitter/nvim-treesitter",
    build = false, -- Don't compile on NixOS
    opts = {
      auto_install = false, -- Install via Nix instead
      ensure_installed = {}, -- Managed by Nix
      autotag = { enable = true },
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "biomejs" },
        typescript = { "biomejs" },
        css = { "stylelint" },
        php = { "phpcs" },  -- Added for PHP
        sh = { "shellcheck" },  -- For Bash (shellcheck is in pkgs.shellcheck, add to home.packages if needed)
        bash = { "shellcheck" },
        zsh = { "shellcheck" },
      }
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
{
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_after_save = { lsp_fallback = true },  -- Auto-format on save
      formatters_by_ft = {
        lua = { "stylua" },
        -- Removed prettier/eslint (Biome replaces for JS/TS/JSON)
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        html = { "biome" },  -- Optional: Biome supports HTML too
        css = { "stylelint" },  -- Keep stylelint or switch if needed
        nix = { "nixpkgs_fmt" },
        rust = { "rustfmt" },
        php = { "blade-formatter" },
        sql = { "sql-formatter" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        yaml = { "biome" },  -- Biome supports YAML
        dockerfile = { "dockfmt" },
      },
      formatters = {
        biome = {
          command = "biome",
          args = { "format", "--stdin-file-path", "$FILENAME" },
          require_cwd = false,  -- Don't require root (fixes standalone files)
        },
        ["sql-formatter"] = {  -- Fix: Explicit config for sql-formatter
          command = "sql-formatter",
          args = { "--fix" },
        },
      },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "typescript" })
    end,
  },
}
