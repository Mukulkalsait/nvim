return {
  -- "rebelot/kanagawa.nvim",
  -- B: new theme Cyberdream
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       -- Enable transparent background
  --       transparent = true,
  --
  --       -- Enable italics comments
  --       italic_comments = true,
  --
  --       -- Replace all fillchars with ' ' for the ultimate clean look
  --       hide_fillchars = false,
  --
  --       -- Modern borderless telescope theme - also applies to fzf-lua
  --       borderless_telescope = false,
  --       -- Set terminal colors used in `:terminal`
  --
  --       terminal_colors = false,
  --
  --       --WARNING:
  --       -- Use caching to improve performance - experimental feature - expect the unexpected!
  --       -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
  --         cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
  --
  --       theme = {
  --         variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
  --         highlights = {
  --           -- Highlight groups to override, adding new groups is also possible
  --           -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
  --
  --           -- Example:
  --           Comment = { fg = "#696969", bg = "black", italic = true },
  --
  --           -- Complete list can be found in `lua/cyberdream/theme.lua`
  --         },
  --
  --         -- Override a highlight group entirely using the color palette
  --         overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
  --           -- Example:
  --           return {
  --             Comment = { fg = colors.green, bg = "NONE", italic = true },
  --             ["@property"] = { fg = colors.magenta, bold = true },
  --           }
  --         end,
  --
  --         -- Override a color entirely
  --         colors = {
  --           -- For a list of colors see `lua/cyberdream/colours.lua`
  --           -- Example:
  --           bg = "#000000",
  --           green = "#00ff00",
  --           magenta = "#ff00ff",
  --         },
  --       },
  --
  --       -- Disable or enable colorscheme extensions
  --       extensions = {
  --         telescope = true,
  --         notify = true,
  --         mini = true,
  --       },
  --     })
  --   end,
  -- },
  -- B: new theme MORTA
  -- {
  --   "philosofonusus/morta.nvim",
  --   name = "morta",
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     -- vim.cmd.colorscheme("morta")
  --   end,
  -- },
  -- B: new theme NIGHTFOX
  { "EdenEast/nightfox.nvim" },
  -- B: new theme OXOCARBON
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   -- Add in any other configuration;
  --   --   event = foo,
  --   --   config = bar
  --   --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {

      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
  {
    "floke/tokyonight.nvim",
    opts = {
      term_colors = true,
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "transparent",
      },
      on_colors = function(colors)
        colors.bg = "#000000"
      end,
    },
  },
}
