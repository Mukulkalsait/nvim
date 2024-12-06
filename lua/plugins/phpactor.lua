-- return {
--   require("mason-lspconfig").setup({
--     ensure_installed = { "phpactor" },
--   }),
--
--   -- Configure PHPactor
--   require("lspconfig").phpactor.setup({
--     on_attach = function(client, bufnr)
--       -- Key mappings for LSP
--       local opts = { noremap = true, silent = true }
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--       -- Add more mappings as needed
--     end,
--     settings = {
--       phpactor = {
--         -- You can add additional settings here if needed
--       },
--     },
--     filetypes = { "php", "html" }, -- Add HTML to the filetypes list
--   }),
-- }
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Setup function for PHPactor
local function setup_phpactor()
  -- Setup Mason LSP Config
  mason_lspconfig.setup({
    ensure_installed = { "phpactor" },
  })

  -- Configure PHPactor
  lspconfig.phpactor.setup({
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    end,
    settings = {
      phpactor = {
        -- Additional settings can go here
      },
    },
    filetypes = { "php", "html" },
  })
end

-- Return the setup function in a table format expected by lazy.nvim
return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    setup_phpactor() -- Call the setup function
  end,
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
}
