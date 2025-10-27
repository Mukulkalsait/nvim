
return {
  "ellisonleao/glow.nvim",
  -- config = true,
  cmd = "Glow",
  keys = {
    { "<leader>mp", "<cmd>Glow<cr>", desc = " Markdown Preview (Glow)" },
  },

  opts = {
    -- style = "dark", -- "auto" tries to detect your Neovim background option. Possible values: "dark", "light", "auto"
    -- style = "~/.config/nvim/plugins/Utility/glowDraculaCostume.json", -- "auto" tries to detect your Neovim background option. Possible values: "dark", "light", "auto"
    -- pager= false, -- with paper true, I Have not idea what difference it make.
    width_ratio = 0.85,
    height_ratio = 0.75,
    border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
    -- position = "right", -- Window position (center, top, bottom, left, right) only in flowting mod
    -- padding = 0, -- Padding between window border and content
    -- log_level = "error", -- values: "error", "warn", "info", "debug" Enable or disable Glow's command output logging (for debugging)
    -- auto_close = true, -- Automatically close Glow preview when you leave the buffer
    -- float = false, -- Open Glow in a floating window (true) or full Neovim buffer (false) Set this to false if you want tab-based or split-based previews
    -- -- glow_path = nil, -- Custom path to your `glow` binary if it's not in $PATH
    -- syntax = true, -- Enable syntax highlighting within the Glow preview (requires glow ≥1.5)
    -- scrolloff = 4, -- Set Glow’s scroll offset when using large files
    -- filetypes = { "markdown", "md", "rmd" }, -- Filetypes that should trigger Glow by default (useful for auto-preview)
  },
}
