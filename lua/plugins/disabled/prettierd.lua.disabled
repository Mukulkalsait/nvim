return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        html = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
      })

      -- Configure prettierd
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        prettierd = {
          env = {
            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.prettierrc"),
          },
        },
      })

      -- Set up format on save
      local conform = require("conform")
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          -- Skip formatting if it's disabled
          if vim.b.disable_autoformat then
            return
          end

          -- Format using conform
          conform.format({
            bufnr = args.buf,
            lsp_fallback = true,
            async = false,
            quiet = false,
            timeout_ms = 500,
            callback = function(err)
              if not err then
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":t")
                vim.notify("Formatted " .. filename .. " with prettierd", vim.log.levels.INFO)
              end
            end,
          })
        end,
      })

      -- Add keybinding for format toggle
      vim.keymap.set({ "n", "v" }, "<leader>uu", function()
        if vim.b.disable_autoformat then
          vim.b.disable_autoformat = false
          vim.notify("Format on save enabled", vim.log.levels.INFO)
        else
          vim.b.disable_autoformat = true
          vim.notify("Format on save disabled", vim.log.levels.INFO)
        end
      end, { desc = "Toggle prettierd format on save" })
    end,
  },
}
