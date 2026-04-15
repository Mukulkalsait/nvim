return {
  -- nvim-lint (optional - you can keep or remove if not needed)
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "biomejs" },
        typescript = { "biomejs" },
        css = { "stylelint" },
        php = { "phpcs" },
        sh = { "shellcheck" },
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

  -- Conform (Fixed version)
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      format_on_save = false, -- Keep disabled

      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome" },
        typescript = { "biome" },
        json = { "biome" },
        html = { "biome" },
        yaml = { "biome" },
        nix = { "nixpkgs_fmt" },
        rust = { "rustfmt" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        php = { "blade-formatter" },
      },

      -- costome formating can be created here.
      formatters = {
        -- biome_nix = {
        --   command = vim.fn.exepath("biome"),
        --   args = { "format", "--write", "--stdin-file-path", "$FILENAME" },
        --   require_cwd = false,
        -- },
      },
    },
  },
}
