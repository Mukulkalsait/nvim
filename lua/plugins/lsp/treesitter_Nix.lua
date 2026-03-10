return {
  "nvim-treesitter/nvim-treesitter",
  build = false, -- Don't build on NixOS
  opts = {
    -- Don't auto-install parsers on NixOS
    auto_install = false,
    ensure_installed = {}, -- Empty - install via Nix instead
    
    autotag = { enable = true },
    indent = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
