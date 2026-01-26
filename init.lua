--
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme tokyonight-night") -- Replace 'tokyonight' with your desired theme
vim.cmd("colorscheme tokyonight-night") -- Replace 'tokyonight' with your desired theme
-- vim.cmd("colorscheme tokyonight-moon") -- Replace 'tokyonight' with your desired theme

vim.o.signcolumn = "yes" -- Show sign column for diagnostics
vim.o.updatetime = 250 -- Update delay for diagnostics
vim.opt.clipboard = "unnamedplus"
-- Load performance optimizations
require("config.performance")

-- vim.filetype.add({ extension = { rgvp = "php" } })
require'lspconfig'.rust_analyzer.setup {

  on_attach = function(client, bufnr)
    -- 🧠 Enable inlay hints automatically when LSP attaches
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  --   -- (Optional) Toggle keybinding: <leader>th
  --   vim.keymap.set("n", "<leader>th", function()
  --     local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  --     vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
  --   end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
  end,

}


