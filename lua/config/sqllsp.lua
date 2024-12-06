local lspconfig = require("lspconfig")

lspconfig.sqlls.setup({
  cmd = { "/home/mukuldk/.local/share/nvim/mason/bin/sqlls" }, -- Ensure this matches the installed binary
  on_attach = function(client, bufnr)
    -- Optional: Add any additional on_attach functionality here
  end,
  capabilities = {}, -- Customize capabilities if needed
})
