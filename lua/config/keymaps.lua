-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>cp", ": ConformInfo <enter>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>cP", ":!prettier --write %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tL", ":Leet<CR>", { noremap = true, silent = true })

-- Format PHP files with HTML LSP formatter
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({ name = "html" })
    end, { buffer = true, desc = "Format HTML in PHP" })
  end,
})
