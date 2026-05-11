-- return {
--   {
--     "mrcjkb/rustaceanvim",
--     version = "^4",
--     ft = { "rust" },
--   },
-- }

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },

    config = function()
      vim.g.rustaceanvim = {
        tools = {
          cargo = {
            command = vim.fn.exepath("cargo"),
          },
        },
        server = {
          cmd = { vim.fn.exepath("rust-analyzer") },
        },
      }
    end,
  },
}
