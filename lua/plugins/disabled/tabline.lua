return {
  "nanozuki/tabby.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail", {
      -- you can add your preset config here
      theme = {
        fill = "TabLineFill",
        head = "TabLine",
        current_tab = "TabLineSel",
        tab = "TabLine",
        win = "TabLine",
        tail = "TabLine",
      },
    })
  end,
}
