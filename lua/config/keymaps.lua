-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.api.nvim_set_keymap("n", "<leader>p", ":lua vim.lsp.buf.formatting_sync()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cp", ":lua format_with_prettier()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cP", ":!prettier --write %<CR>", { noremap = true, silent = true })
