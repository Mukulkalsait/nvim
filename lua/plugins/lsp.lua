local cmd = require("lazy.core.handler.cmd")
local filetype = require("vim.filetype")
-- html error fingind html-lsp config done by me and chatgpt
return {
  -- local lspconfig = require("lspconfig")

  -- Set up HTML LSP
  require("lspconfig").html.setup({
    cmd = { "vscode-html-language-server", "--stdio" },
    filetype = { "html", "htmldjango", "eruby", "php", "css" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(_, bufnr)
      -- Keybinding for formatting
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>cx",
        ":lua vim.lsp.buf.format()<CR>",
        { noremap = true, silent = true }
      )
    end,
  }),

  -- Emmet setup (optional)
  -- vim.g.user_emmet_leader_key = "<C-E>" -- Set Emmet leader key if desired
}
