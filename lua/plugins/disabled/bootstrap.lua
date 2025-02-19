return {
  {
    "neovim/nvim-lspconfig",
    enabled = true, -- Set to false to disable Bootstrap support
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Install and configure HTML LSP with Bootstrap support
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "html" }, -- Changed from "html-lsp" to "html"
      })

      local lspconfig = require("lspconfig")
      lspconfig.html.setup({
        filetypes = { "html", "php", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        init_options = {
          provideFormatter = true,
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
        },
        settings = {
          html = {
            completions = {
              enable = true,
              emmet = true,
            },
            format = {
              enable = true,
            },
            customData = {
              {
                name = "bootstrap5",
                description = "Bootstrap 5 Custom Data",
                version = "5.0",
                tags = {
                  -- Bootstrap component tags
                  ["nav"] = {
                    attributes = {
                      ["class"] = {
                        values = {
                          "navbar",
                          "navbar-expand-lg",
                          "navbar-light",
                          "navbar-dark",
                          "bg-light",
                          "bg-dark",
                        },
                      },
                    },
                  },
                  ["button"] = {
                    attributes = {
                      ["class"] = {
                        values = {
                          "btn",
                          "btn-primary",
                          "btn-secondary",
                          "btn-success",
                          "btn-danger",
                          "btn-warning",
                          "btn-info",
                          "btn-light",
                          "btn-dark",
                          "btn-link",
                          "btn-sm",
                          "btn-lg",
                        },
                      },
                    },
                  },
                },
                globalAttributes = {
                  ["class"] = {
                    values = {
                      -- Layout
                      "container",
                      "container-fluid",
                      "container-sm",
                      "container-md",
                      "container-lg",
                      "container-xl",
                      "row",
                      "col",
                      "col-sm",
                      "col-md",
                      "col-lg",
                      "col-xl",
                      -- Spacing
                      "m-1",
                      "m-2",
                      "m-3",
                      "m-4",
                      "m-5",
                      "mt-1",
                      "mt-2",
                      "mt-3",
                      "mt-4",
                      "mt-5",
                      "mb-1",
                      "mb-2",
                      "mb-3",
                      "mb-4",
                      "mb-5",
                      "ms-1",
                      "ms-2",
                      "ms-3",
                      "ms-4",
                      "ms-5",
                      "me-1",
                      "me-2",
                      "me-3",
                      "me-4",
                      "me-5",
                      "p-1",
                      "p-2",
                      "p-3",
                      "p-4",
                      "p-5",
                      -- Components
                      "card",
                      "card-body",
                      "card-title",
                      "card-text",
                      "card-header",
                      "card-footer",
                      "alert",
                      "alert-primary",
                      "alert-secondary",
                      "alert-success",
                      "alert-danger",
                      "form-control",
                      "form-label",
                      "form-text",
                      "form-select",
                      "table",
                      "table-striped",
                      "table-bordered",
                      "table-hover",
                      -- Utilities
                      "text-primary",
                      "text-secondary",
                      "text-success",
                      "text-danger",
                      "bg-primary",
                      "bg-secondary",
                      "bg-success",
                      "bg-danger",
                      "d-flex",
                      "d-grid",
                      "d-none",
                      "d-block",
                      "justify-content-start",
                      "justify-content-center",
                      "justify-content-end",
                      "align-items-start",
                      "align-items-center",
                      "align-items-end",
                    },
                  },
                },
              },
            },
          },
        },
      })
    end,
  },
}
