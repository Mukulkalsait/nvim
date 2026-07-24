-- In your conform.lua
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Use LSP formatting if formatter not found
    },

    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome" },
      typescript = { "biome" },
      json = { "biome" },
      html = { "biome" },
      yaml = { "biome" },
      nix = { "nixpkgs_fmt" },
      rust = { "rustfmt" }, -- Use rustfmt for Rust
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },
      php = { "blade-formatter" },
    },

    -- Custom formatter configuration for rustfmt
    formatters = {
      rustfmt = {
        -- Y: the main config is in ~/.cofnig/rustfmt/rustfmt.toml  -> NixConfig
        command = "rustfmt",
        args = { "--emit", "stdout" }, -- Output to stdout for conform to handle
        stdin = true,
      },
    },
  },
}
