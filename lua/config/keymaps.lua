-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.api.nvim_set_keymap("n", "<leader>cp", ": ConformInfo <enter>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>cP", ":!prettier --write %<CR>", { noremap = true, silent = true })
--
-- vim.api.nvim_set_keymap("n", "<leader>tL", ":Leet<CR>", { noremap = true, silent = true })

-- B: LSP Navigation
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Docs" })

-- B: Tabs no need check => <space>sk => then serarch tab 
-- vim.keymap.set("n", "<leader>Th", ":tabprevious<CR>", { desc = "Previous Tab" })
-- vim.keymap.set("n", "<leader>Tl", ":tabnext<CR>", { desc = "Next Tab" })
-- vim.keymap.set("n", "<leader>Tn", ":tabnew<CR>", { desc = "New Tab" })
-- vim.keymap.set("n", "<leader>Td", ":tabclose<CR>", { desc = "Close Tab" })
-- vim.keymap.set("n", "<leader>To", ":tabonly<CR>", { desc = "Close Other Tabs" })

-- TERMINAL
-- vim.keymap.set({"n","t"}, "<C-/>", function()
--   Snacks.terminal.toggle()
-- end, { desc = "Toggle Terminal" })


-- Format PHP files with HTML LSP formatter
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "php",
--   callback = function()
--     vim.keymap.set("n", "<leader>cf", function()
--       vim.lsp.buf.format({ name = "html" })
--     end, { buffer = true, desc = "Format HTML in PHP" })
--   end,
-- })

 -- require("which-key").add({ { "<leader>m",icon = " ", group = "Preview" }, }) -- for markdown file
