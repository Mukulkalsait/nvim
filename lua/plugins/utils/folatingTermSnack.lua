return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = vim.o.shell,
        cwd = vim.loop.cwd(), -- stable working dir
        win = {
          position = "float",
          border = "rounded",
          wo = { winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder", },
        },
      },
    },

    keys = {
      {
        "<C-/>",
        function()
          Snacks.terminal.toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle Floating Terminal",
      },
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "New Terminal",
      }
    },
  },
}
