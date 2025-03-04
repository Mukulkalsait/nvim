return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup({
      window = {
        width = 20, -- reduce width (default is 40)
        -- height = 15, -- reduce height (default varies)
      },
    })
  end,
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
