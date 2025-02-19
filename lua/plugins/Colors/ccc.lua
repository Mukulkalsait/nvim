return {
  "uga-rosa/ccc.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ccc = require("ccc")
    local mapping = ccc.mapping

    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
        excludes = {},
      },
      recognize = {
        input = true,
        output = true,
      },
      picker = {
        use_system_clipboard = true,
        output_format = "hex",
      },
      -- Configure more Vim-like mappings
      mappings = {
        ["<Tab>"] = mapping.toggle_input_mode, -- Toggle between color formats
        ["<S-Tab>"] = mapping.toggle_output_mode, -- Toggle output format
        ["q"] = mapping.quit,
        ["H"] = mapping.decrease10, -- Decrease by 1 (more Vim-like)
        ["L"] = mapping.increase10, -- Increase by 1
        ["h"] = mapping.decrease1, -- Decrease by 10
        ["l"] = mapping.increase1, -- Increase by 10
        ["0"] = mapping.set0, -- Set to 0%
        ["$"] = mapping.set100, -- Set to 100%
        ["<Space>"] = mapping.complete, -- Confirm selection
      },
    })

    -- Set up global keymaps for accessing the plugin
    vim.keymap.set("n", "<leader>cc", ":CccPick<CR>", { noremap = true, silent = true, desc = "Open color picker" })
    vim.keymap.set(
      "n",
      "<leader>ch",
      ":CccHighlighterToggle<CR>",
      { noremap = true, silent = true, desc = "Toggle color highlighting" }
    )
    vim.keymap.set(
      "n",
      "<leader>cv",
      ":CccConvert<CR>",
      { noremap = true, silent = true, desc = "Convert color format" }
    )
  end,
}
