return{
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
      -- format_after_save = { lsp_fallback = true },  -- Auto-format on save
      format_after_save = false,  -- Auto-format OFF on save
      formatters_by_ft = {
        lua = { "stylua" },
        -- Removed prettier/eslint (Biome replaces for JS/TS/JSON)
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        html = { "biome" },  -- Optional: Biome supports HTML too
        css = { "stylelint" },  -- Keep stylelint or switch if needed
        nix = { "nixpkgs_fmt" },
        rust = { "rustfmt" , lsp_format = "fallback"},
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
}
