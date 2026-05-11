return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "php",
        "rust",
        "python",
        "javascript",
        "typescript",
        "lua",
        "yaml",
        "bash",
      }, -- Empty - install via Nix instead

      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
      modules = {},

      -- code_blocks = {
      --   enable = true,
      --   icons = true,
      --   style = "minimal",
      --   highlight = "treesitter",  -- if supported
      -- },
      -- Better code block highlighting in markdown
      -- injections = {
      --   markdown = { enable = true },
      -- },
    },
  },

  -- Fixed autotag (loads AFTER Treesitter is ready) B: WORKING PERFECTLY...
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy", -- Important: load later
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      })
    end,
  },
}

