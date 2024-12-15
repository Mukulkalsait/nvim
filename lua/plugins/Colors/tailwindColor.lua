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
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        emmet_ls = {},
        intelephense = {},
        phpactor = {},
        tailwindcss = {},
        tailwind = {},
        eslint = {},
        sqlls = {},
      },
    },
  },
  -- TODO:
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  --   },
  --   opts = function(_, opts)
  --     -- original LazyVim kind icon formatter
  --     local format_kinds = opts.formatting.format
  --     opts.formatting.format = function(entry, item)
  --       format_kinds(entry, item) -- add icons
  --       return require("tailwindcss-colorizer-cmp").formatter(entry, item)
  --     end
  --   end,
  -- },
}
