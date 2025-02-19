return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        -- Explicitly define CTRL-Y and CTRL-E behaviors
        ["<C-y>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({
              select = false, -- Don't auto-select, only confirm the currently selected item
              behavior = cmp.ConfirmBehavior.Insert,
            })
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-e>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort() -- Explicitly abort completion without inserting
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      return opts
    end,
  },
  {
    -- Additional support for Vim's built-in completion
    "vim-scripts/SearchComplete",
    event = "VeryLazy",
  },
}
