return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local M = {}

    M.keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = "✅", color = "info" },
      HACK = { icon = "🦆", color = "error" },
      WARN = { icon = "🔂", color = "warning" },
      NOTE = { icon = "📓", color = "hint" },
      TEST = { icon = "⏲ ", color = "test" },
      PERF = { icon = "💻", color = "rest" },
      BASH = { icon = "", color = "head" },
      ZSH = { icon = "", color = "imp" },
      --
      NAV = { icon = "🗣", color = "imp", alt = { "TESTING", "PASSED", "FAILED" } },
      HEAD = { icon = "🔝", color = "head", alt = { "TESTING", "PASSED", "FAILED" } },
      TAG = { icon = "⭕", color = "tag", alt = { "TESTING", "PASSED", "FAILED" } },
      CARD = { icon = "🎴", color = "card", alt = { "TESTING", "PASSED", "FAILED" } },
      DIV = { icon = "🍱", color = "div", alt = { "TESTING", "PASSED", "FAILED" } },
      CLASS = { icon = "🏛️", color = "class", alt = { "TESTING", "PASSED", "FAILED" } },
      ID = { icon = "🆔", color = "id", alt = { "TESTING", "PASSED", "FAILED" } },
      --
      R = { icon = "🟥", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      R2 = { icon = "🍎", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      B = { icon = "🟦", color = "bluex", alt = { "TESTING", "PASSED", "FAILED" } },
      B2 = { icon = "💙", color = "bluex", alt = { "TESTING", "PASSED", "FAILED" } },
      G = { icon = "🟩", color = "greenx", alt = { "TESTING", "PASSED", "FAILED" } },
      G2 = { icon = "💚", color = "greenx", alt = { "TESTING", "PASSED", "FAILED" } },
      Y = { icon = "🟨", color = "yellowx", alt = { "TESTING", "PASSED", "FAILED" } },
      Y2 = { icon = "💛", color = "yellowx", alt = { "TESTING", "PASSED", "FAILED" } },
      --
      DX = { icon = "⛔", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      IMP = { icon = "👿", color = "imp", alt = { "TESTING", "PASSED", "FAILED" } },
    }

    M.colors = {
      imp = "#F26B0F",
      info = "#2563EB",
      error = "#DC2626",
      warning = "#FBBF24",
      hint = "#10B981",
      default = "#7C3AED",
      test = "#FF00FF",
      rest = "#1F09AF",
      head = "#006BFF",
      tag = "#997C70",
      card = "#D2FF72",
      id = "#FFB4B4",
      class = "#FF2929",
      div = "#FF76CE",
      redx = "#FF0000",
      bluex = "#0D92F4",
      greenx = "#6EC207",
      yellowx = "#FFE700",
    }

    M.options = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      keywords = M.keywords,
      colors = M.colors,
      merge_keywords = true,
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or lua regex
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      },
    }

    -- Function to create custom highlight groups
    local function setup_todo_highlights()
      for name, color in pairs(M.colors) do
        vim.api.nvim_set_hl(0, "TodoColor" .. name:gsub("^%l", string.upper), { fg = color })
      end
    end

    -- Create an autocommand to set up highlights after colorscheme is loaded
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = setup_todo_highlights,
    })

    -- Initial setup of highlights
    setup_todo_highlights()

    -- Setup todo-comments with options
    require("todo-comments").setup(M.options)
  end,
}

-- tests --
--======================================================================================================

--TODO:
--======================================================================================================
--HACK:
--======================================================================================================
--WARN:
--======================================================================================================
--NOTE:
--======================================================================================================
--TEST:
--======================================================================================================
--PERF:
--======================================================================================================
--BASH:
--======================================================================================================
--ZSH:
--======================================================================================================
--INFO:
--
--HEAD:
--======================================================================================================
--TAG:
--======================================================================================================
--CARD:
--======================================================================================================
--DIV:
--======================================================================================================
--CLASS:
--======================================================================================================
--ID:
--======================================================================================================
--R:
--======================================================================================================
--B:
--======================================================================================================
--G:
--======================================================================================================
--Y:
--======================================================================================================
--R2:
--======================================================================================================
--B2:
--======================================================================================================
--G2:
--======================================================================================================
--Y2:
--======================================================================================================
--
--DX:
--======================================================================================================
