return {
  "kawre/leetcode.nvim",
  enabled = true, -- Set to false if you want to disable temporarily
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    -- Ensure the directory exists before setup
    local home_path = "/home/mukuldk/1_file/3_Repos_All/A_gitHub/2_rust-Programming/3_leetCode/leetnvim/src/bin/"
    
    -- Create directory if it doesn't exist
    vim.fn.mkdir(home_path, "p")
    
    require("leetcode").setup({
      storage = {
        home = home_path,
        cache = vim.fn.stdpath("cache") .. "/leetcode",
      },
      lang = "rust",
    })
  end,
}
