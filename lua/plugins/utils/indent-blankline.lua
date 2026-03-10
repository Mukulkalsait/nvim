-- ~/.config/nvim/lua/plugins/indent-blankline.lua
return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
    end)

    hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
    )

    return {
      indent = { highlight = highlight },
      scope  = { highlight = highlight },
    }
  end,
-- ~/.config/nvim/lua/plugins/indent-blankline.lua
-- add at the end of your existing config, inside the same return block
vim.keymap.set("n", "<leader>uRi", function()
  local ibl = require("ibl")
  -- nil means enabled (default), so we treat nil as true
  local currently_enabled = vim.g.ibl_enabled ~= false
  vim.g.ibl_enabled = not currently_enabled
  ibl.update({ enabled = vim.g.ibl_enabled })
end, { desc = "Toggle Indent Guides" });

vim.keymap.set("n", "<leader>uRd", function()
  local rd = require("rainbow-delimiters")
  local currently_enabled = vim.g.rainbow_delimiters_enabled ~= false
  vim.g.rainbow_delimiters_enabled = not currently_enabled
  if vim.g.rainbow_delimiters_enabled then
    rd.enable(0)
  else
    rd.disable(0)
  end
end, { desc = "Toggle Rainbow Delimiters" });




}


