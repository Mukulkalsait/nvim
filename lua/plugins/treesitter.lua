return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = false,
    opts = {
      auto_install = false,

      ensure_installed = {
        -- "markdown",
        -- "markdown_inline",
        -- "php",
        -- "rust",
        -- "python",
        -- "javascript",
        -- "typescript",
        -- "lua",
        -- "bash",
      }, -- Empty - install via Nix instead

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },

      indent = { enable = true },

      -- Better code block highlighting in markdown
      injections = {
        markdown = { enable = true },
      },
    },
  },

  -- Fixed autotag (loads AFTER Treesitter is ready)
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
