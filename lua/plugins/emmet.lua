return {
  {
    "olrtg/nvim-emmet",
    config = function()
      local emmet = require("nvim-emmet")

      vim.keymap.set({ "n", "v" }, "<leader>xe", emmet.wrap_with_abbreviation, { desc = "Wrap with abbreviation" })

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "php", -- this is file type
      --   callback = function()
      --     vim.bo.filetype = "html" -- this is how emmet will see the file.
      --   end,
      --     })
    end,
  },
}
