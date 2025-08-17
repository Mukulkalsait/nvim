return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    storage = {
      -- home = vim.fn.stdpath("config") .. "/home/mukuldk/1Home/1Projects/class/2_rust-Programming/3_leetCode/leetnvim/", Y: here vim.fn.stdpath("config") adds /home/$user/.config
      home = "/home/mukuldk/1Home/1Projects/class/2_rust-Programming/3_leetCode/leetnvim/src/bin/",
      cache = vim.fn.stdpath("cache") .. "/leetcode", -- optional
    },
    -- your leetcode configuration
    lang = "rust",
  },
}
