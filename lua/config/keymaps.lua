-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>cp", ": ConformInfo <enter>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cP", ":!prettier --write %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tL", ":Leet<CR>", { noremap = true, silent = true })
