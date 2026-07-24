-- Working Perfectly.
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local M = {}

    M.keywords = {
      FIX = {
        icon = "󰁨 ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },

      ---------------------------------------------
      TODO = { icon = "✅", color = "info" },
      --TODO:
      INFO = { icon = "ℹ️", color = "imp", alt = { "TESTING", "PASSED", "FAILED" } },
      --INFO:
      HACK = { icon = "🦆", color = "error" },
      --HACK:
      WARN = { icon = "☣️", color = "warning" },
      --WARN:
      NOTE = { icon = "📓", color = "hint" },
      --NOTE:
      DX = { icon = "⛔", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      --DX:
      IMP = { icon = "👿", color = "imp", alt = { "TESTING", "PASSED", "FAILED" } },
      --IMP:
      R = { icon = "🟥", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      --R:
      R2 = { icon = "🍎", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      --R2:
      B = { icon = "🟦", color = "bluex", alt = { "TESTING", "PASSED", "FAILED" } },
      --B:
      B2 = { icon = "💙", color = "bluex", alt = { "TESTING", "PASSED", "FAILED" } },
      --B2:
      G = { icon = "🟩", color = "greenx", alt = { "TESTING", "PASSED", "FAILED" } },
      --G:
      G2 = { icon = "💚", color = "greenx", alt = { "TESTING", "PASSED", "FAILED" } },
      --G2:
      Y = { icon = "🟨", color = "yellowx", alt = { "TESTING", "PASSED", "FAILED" } },
      --Y:
      Y2 = { icon = "💛", color = "yellowx", alt = { "TESTING", "PASSED", "FAILED" } },
      --Y2:
      ---------------------------------------------
      BASH = { icon = "", color = "head" },
      --BASH:
      ZSH = { icon = "", color = "imp" },
      --ZSH:
      FLAKE = { icon = "❄️", color = "card" },
      --FLAKE:
      Ty = { icon = "🦾", color = "div", alt = { "TESTING", "PASSED", "FAILED" } },
      --Ty:
      Ty2 = { icon = "🦿", color = "contrastGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --Ty2:
      eg = { icon = "🙈", color = "tag", alt = { "TESTING", "PASSED", "FAILED" } },
      --eg:
      TAG = { icon = "⭕", color = "darkGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --TAG:
      GEN = { icon = "🎴", color = "card", alt = { "TESTING", "PASSED", "FAILED" } },
      --GEN:
      LT = { icon = "🍱", color = "div", alt = { "TESTING", "PASSED", "FAILED" } },
      --LT:
      CLASS = { icon = "🏛️", color = "class", alt = { "TESTING", "PASSED", "FAILED" } },
      --CLASS:
      ID = { icon = "🆔", color = "id", alt = { "TESTING", "PASSED", "FAILED" } },
      --ID:
      scO = { icon = "🧮", color = "creamCHa" },
      --scO:
      tcO = { icon = "⌛", color = "blueCHp2" },
      --tcO:
      ---------------------------------------------
      Fn1 = { icon = "⨐", color = "fn", alt = { "TESTING", "PASSED", "FAILED" } },
      --Fn1:
      Fn2 = { icon = "⨐", color = "warning", alt = { "TESTING", "PASSED", "FAILED" } },
      --Fn2:
      Fn3 = { icon = "⨐", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      --Fn3:
      Fn4 = { icon = "⨐", color = "creamCHa", alt = { "TESTING", "PASSED", "FAILED" } },
      --Fn4:
      ---------------------------------------------
      Trait = { icon = "❄️", color = "card" },
      --Trait:
      Iter = { icon = "🔁", color = "imp", alt = { "TESTING", "PASSED", "FAILED" } },
      --Iter:
      TYPE = { icon = "🔝", color = "head", alt = { "TESTING", "PASSED", "FAILED" } },
      --TYPE:
      Err = { icon = "⁉️", color = "id" },
      --Err:
      TEST = { icon = "🧪", color = "test" },
      --TEST:
      ENUM = { icon = " ", color = "greenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --ENUM:
      Enum = { icon = " ", color = "brownCHa", alt = { "TESTING", "PASSED", "FAILED" } },
      --Enum:
      STRUCT = { icon = "👾", color = "contrastGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --STRUCT:
      Struct = { icon = "👾", color = "contrastGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --Struct:
      IMPL = { icon = "🛗", color = "darkGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --IMPL:
      Impl = { icon = "🛗", color = "tag", alt = { "TESTING", "PASSED", "FAILED" } },
      --Impl:
      ImplFor = { icon = "🏧", color = "lightPinkCHp2", alt = { "TESTING", "PASSED", "FAILED" } },
      --ImplFor:
      LIFETIME = { icon = "🧬", color = "contrastGreenCHp1", alt = { "TESTING", "PASSED", "FAILED" } },
      --LIFETIME:
      Ref = { icon = "⏺️", color = "class", alt = { "TESTING", "PASSED", "FAILED" } },
      --Ref:
      DeRef = { icon = "⚜️", color = "hint", alt = { "TESTING", "PASSED", "FAILED" } },
      --DeRef:
      End = { icon = "🔚", color = "redx", alt = { "TESTING", "PASSED", "FAILED" } },
      --End:
      ---------------------------------------------
    }

    M.colors = {
      imp = "#F26B0F",
      info = "#2563EB",
      error = "#DC2626",
      warning = "#FBBF24",
      hint = "#10B981",
      fn = "#14B981",
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
      -- colorhunt
      pinkCHa = "#F7374F",
      greenCHa = "#5F8B4C",
      orangeCHa = "#EC5228",
      creamCHa = "#FBFFE4",
      brownCHa = "#854836",
      blackCHa = "#000000",
      mehandiCHa = "#2C3930",
      lightCHa = "#B5828C",
      -- colorhunt palet 1
      greenCHp1 = "#3E7B27",
      darkGreenCHp1 = "#123524",
      contrastGreenCHp1 = "#EFE3C2",
      -- colorhunt palet 2
      blackCHp2 = "#2A3335",
      blueCHp2 = "#0A5EB0",
      lightPinkCHp2 = "#FCC6FF",
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
