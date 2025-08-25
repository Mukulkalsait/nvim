return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Enable LSPs
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.vtsls.setup({})
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "prepend",              -- make sure Nix-installed LSPs are found
      ensure_installed = {},         -- don't let Mason install anything
      automatic_installation = false,
    },
  },
}
