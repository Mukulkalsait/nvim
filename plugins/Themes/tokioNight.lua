return {
  {
    "folke/tokyonight.nvim",
    opts = {
      term_colors = true,
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Main background pure black
        colors.bg = "#000000"

        -- Slightly blue-tinted dark for sidebars
        -- Using #0A0A12 - barely visible blue tint
        colors.bg_sidebar = "#0A0A12"

        -- Slightly lighter black for floating windows
        -- Using #0A0A0A - just a touch lighter than black
        -- colors.bg_float = "#0A0A0A"

        -- Adjust other dark colors to maintain contrast
        colors.bg_dark = "#0A0A0A"
        colors.bg_popup = "#0A0A0A"
        colors.bg_statusline = "#0A0A12"

        -- Make sure search and selection highlights remain visible
        colors.bg_visual = "#193549"
        colors.bg_search = "#193549"
      end,
    },
  },
}
