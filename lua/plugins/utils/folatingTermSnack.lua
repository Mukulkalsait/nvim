return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = true };
      terminal = {
        shell = vim.o.shell,
        cwd = vim.loop.cwd(),
        win = {
          position = "float",
          border = "rounded",
        },
      },
    },

    keys = {
      { "<C-/>", function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Toggle Floating Terminal", },
      { "<leader>tt", function() Snacks.terminal(nil, { reuse = false }) end, desc = "New Terminal", },
    },
  },
}
