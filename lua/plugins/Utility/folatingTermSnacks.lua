-- return {
--   {
--     "akinsho/toggleterm.nvim",
--     version = "*",
--     opts = {
--       shell = "/usr/bin/zsh",
--       direction = "float",
--       float_opts = {
--         border = "curved",
--         winblend = 3,
--         width = function()
--           return math.floor(vim.o.columns * 0.8)
--         end,
--         height = function()
--           return math.floor(vim.o.lines * 0.8)
--         end,
--       },
--     },
--     keys = {
--       { "<C-/>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
--     },
--   },
-- }
--
--
return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = vim.o.shell, -- Y: or /etc/profiles/per-user/mukuldk/bin/zsh
        win = {
          position = "float",
        },
      },
    },
  },
}
