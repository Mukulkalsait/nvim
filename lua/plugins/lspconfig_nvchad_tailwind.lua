local tailwind = require("lazyvim.plugins.extras.lang.tailwind")
local sqlls = require("lspconfig.configs.sqlls")
local lspconfig = require("lspconfig")

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
        -- ast_grep = {
        --   cmd = { "ast-grep", "lsp" },
        --   root_dir = function(fname)
        --     return lspconfig.util.root_pattern(".git")(fname) or vim.fn.getcwd()
        --   end,
        --   filetypes = {
        --     "c",
        --     "cpp",
        --     "rust",
        --     "go",
        --     "java",
        --     "python",
        --     "javascript",
        --     "typescript",
        --     "html",
        --     "css",
        --     "kotlin",
        --     "dart",
        --     "lua",
        --     "php",
        --   },
        --   autostart = true,
        -- },
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
}
