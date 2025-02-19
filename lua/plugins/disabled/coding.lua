return {
  {
    "windwp/nvim-ts-autotag",
    enabled = true, -- Set to false to disable
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        -- Configuration...
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    enabled = true,
    event = "InsertEnter",
    opts = {
      -- Configuration...
    },
  },
}
