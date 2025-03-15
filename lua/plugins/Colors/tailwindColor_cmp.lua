return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {},
        intelephense = {},
        phpactor = {},
        tailwindcss = {},
        eslint = {},
        sqlls = {},
      },
    },
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   opts = {
  --     user_default_options = {
  --       emmet_ls = {},
  --       intelephense = {},
  --       phpactor = {},
  --       tailwindcss = {},
  --       tailwind = {},
  --       eslint = {},
  --       sqlls = {},
  --     },
  --   },
  -- },
  -- TODO:
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
  -- Y: this is tryginto install cmp-nvim-lsp but not working.
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  --     "hrsh7th/cmp-nvim-lsp", -- Required for LSP completions
  --     "hrsh7th/cmp-buffer", -- Optional: For buffer completions
  --     "hrsh7th/cmp-path", -- Optional: For path completions
  --   },
  --   opts = function(_, opts)
  --     -- Ensure LSP source is enabled
  --     opts.sources = {
  --       { name = "nvim_lsp" }, -- LSP completions
  --       { name = "buffer" }, -- Buffer completions
  --       { name = "path" }, -- Path completions
  --     }
  --
  --     -- Original LazyVim kind icon formatter
  --     local format_kinds = opts.formatting.format
  --     opts.formatting.format = function(entry, item)
  --       format_kinds(entry, item) -- Add icons
  --       return require("tailwindcss-colorizer-cmp").formatter(entry, item)
  --     end
  --   end,
  -- },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
}
