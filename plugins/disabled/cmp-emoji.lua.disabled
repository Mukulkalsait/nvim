return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Add emoji source to completion sources
      table.insert(opts.sources, { name = "emoji" })

      -- Restore ctrl+y for confirming selection and maintain existing configuration
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-y>"] = cmp.mapping.confirm({
          select = true, -- Automatically select the first item if no item is selected
          behavior = cmp.ConfirmBehavior.Replace, -- Replace the text with the completed suggestion
        }),
        -- Ensure other default mappings remain intact
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })

      return opts
    end,
  },
}
