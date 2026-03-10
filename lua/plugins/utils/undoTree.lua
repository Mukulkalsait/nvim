-- Y: undo tree its super awsome.
-- return {
--   "jiaoshijie/undotree",
--   dependencies = "nvim-lua/plenary.nvim",
--   config = function()
--     require("undotree").setup({
--       window = {
--         width = 20, -- reduce width (default is 40)
--         -- height = 15, -- reduce height (default varies)
--       },
--     })
--   end,
--   keys = {
--     { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
--   },
-- }
return{
  "jiaoshijie/undotree",
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    -- { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    { "<leader>tu", "<cmd>lua require('undotree').toggle()<cr>" , desc = "Undo Tree", },
  },
}
