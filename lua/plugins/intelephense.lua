return {

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        intelephense = {},
        tsserver = {},
      },
      -- setup = {
      --   tsserver = function(_, opts)
      --     require("typescript").setup({ server = opts })
      --     return true
      --   end,
      --   intelephense = function(_, opts)
      --     require("lspconfig").intelephense.setup({
      --       on_attach = function(_, bufnr)
      --         -- Key mappings for LSP
      --         local map_opts = { noremap = true, silent = true }
      --         vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", map_opts)
      --         vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", map_opts)
      --         vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", map_opts)
      --         -- Add more mappings as needed
      --       end,
      --       settings = {
      --         intelephense = {
      --           stubs = {
      --             "apache",
      --             "bcmath",
      --             "bz2",
      --             "calendar",
      --             "com",
      --             "curl",
      --             "dba",
      --             "dom",
      --             "fileinfo",
      --             "filter",
      --             "gd",
      --             "gettext",
      --             "iconv",
      --             "intl",
      --             "json",
      --             "ldap",
      --             "mbstring",
      --             "mysqli",
      --             "nginx",
      --             "oci8",
      --             "odbc",
      --             "openssl",
      --             "pdo",
      --             "pdo_mysql",
      --             "pgsql",
      --             "phar",
      --             "readline",
      --             "shmop",
      --             "simplexml",
      --             "soap",
      --             "sockets",
      --             "sodium",
      --             "sysvmsg",
      --             "sysvsem",
      --             "sysvshm",
      --             "tidy",
      --             "tokenizer",
      --             "xml",
      --             "xmlreader",
      --             "xmlwriter",
      --             "xsl",
      --             "zend",
      --             "zip",
      --             "zlib",
      --           },
      --         },
      --       },
      --     })
      --     return true
      --   end,
      --   ["*"] = function(server, opts) end,
      -- },
    },
  },
}
