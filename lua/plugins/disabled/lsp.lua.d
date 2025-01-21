return {
  {
    "neovim/nvim-lspconfig",
    enabled = true, -- Set to false to disable
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      servers = {
        -- Each server configuration can be enabled/disabled individually
        html = {
          enabled = true,
          filetypes = { "html", "php", "javascript" },
          -- Rest of HTML configuration...
        },
        cssls = {
          enabled = true,
          -- Rest of CSS configuration...
        },
        tailwindcss = {
          enabled = true,
          -- Rest of Tailwind configuration...
        },
        -- Add Bootstrap LSP configuration
        bootstrap_ls = {
          enabled = true, -- Set to false to disable Bootstrap support
          filetypes = {
            "html",
            "php",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
          settings = {
            bootstrap = {
              validate = true,
              completion = {
                enable = true,
                classNames = true,
                components = true,
              },
            },
          },
        },
      },
    },
  },
}
