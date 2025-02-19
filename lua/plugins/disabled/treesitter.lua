return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    opts = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "php",
        "json",
        "yaml",
        "markdown",
        "sql",
      },
      -- Rest of configuration...
    },
  },
}
