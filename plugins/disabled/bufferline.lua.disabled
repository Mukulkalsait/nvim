return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant",
        indicator = {
          icon = "▎", -- This creates a more subtle indicator
          style = "icon",
        },
        modified_icon = "●",
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        tab_size = 20,
        max_name_length = 20,
        -- Always show all buffers
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        highlights = {
          fill = {
            fg = "#232136",
            bg = "#232136",
          },
          background = {
            fg = "#787c99",
            bg = "#2d2b40",
          },
          tab = {
            fg = "#787c99",
            bg = "#2d2b40",
          },
          tab_selected = {
            fg = "#e0def4",
            bg = "#393552",
            bold = true,
          },
          buffer_visible = {
            fg = "#e0def4",
            bg = "#2d2b40",
          },
          buffer_selected = {
            fg = "#e0def4",
            bg = "#393552",
            bold = true,
          },
          separator = {
            fg = "#232136",
            bg = "#2d2b40",
          },
          separator_selected = {
            fg = "#2d2b40",
            bg = "#393552",
          },
          indicator_selected = {
            fg = "#c4a7e7",
            bg = "#393552",
          },
          modified = {
            fg = "#f6c177",
            bg = "#2d2b40",
          },
          modified_selected = {
            fg = "#f6c177",
            bg = "#393552",
          },
          duplicate = {
            fg = "#787c99",
            bg = "#2d2b40",
            italic = false,
          },
          duplicate_selected = {
            fg = "#e0def4",
            bg = "#393552",
            italic = false,
          },
          diagnostic = {
            fg = "#908caa",
            bg = "#2d2b40",
          },
          diagnostic_selected = {
            fg = "#908caa",
            bg = "#393552",
            bold = true,
            italic = false,
          },
          hint = {
            fg = "#908caa",
            bg = "#2d2b40",
          },
          hint_selected = {
            fg = "#908caa",
            bg = "#393552",
            bold = true,
            italic = false,
          },
          warning = {
            fg = "#f6c177",
            bg = "#2d2b40",
          },
          warning_selected = {
            fg = "#f6c177",
            bg = "#393552",
            bold = true,
            italic = false,
          },
          error = {
            fg = "#eb6f92",
            bg = "#2d2b40",
          },
          error_selected = {
            fg = "#eb6f92",
            bg = "#393552",
            bold = true,
            italic = false,
          },
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          {
            "branch",
            separator = { right = "" },
            padding = { left = 1, right = 1 },
          },
          {
            "diagnostics",
            separator = { right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_x = {
          {
            "filetype",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {
          {
            "progress",
            separator = { left = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_z = {
          {
            "location",
            separator = { left = "" },
            padding = { left = 1, right = 1 },
          },
        },
      },
    },
  },
}
