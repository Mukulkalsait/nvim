-- B: WORKING PERFECTLY
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
  },
}
