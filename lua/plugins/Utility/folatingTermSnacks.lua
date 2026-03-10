-- return {
--   {
--     "folke/snacks.nvim",
--     opts = {
--       terminal = {
--         shell = vim.o.shell, -- Y: or /etc/profiles/per-user/mukuldk/bin/zsh
--         win = {
--           position = "float",
--         },
--       },
--     },
--   },
-- }
return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = vim.o.shell,
        win = {
          position = "float",
        },
      },
    },
    keys = {
      {
        "<C-/>",
        function()
          require("snacks").terminal()
        end,
        mode = { "n", "t" },
        desc = "Toggle Terminal",
      },
    },
  },
}
