return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },

    config = function()
      vim.g.rustaceanvim = {
        tools = {
          cargo = {
            command = vim.fn.exepath("cargo"),
          },
        },
        server = {
          cmd = { vim.fn.exepath("rust-analyzer") },

          settings = {
            ["rust-analyzer"] = {
              -- cargo = { allFeatures = false, loadOutDirsFromCheck = false, },
              -- checkOnSave = false,
              procMacro = { enable = true }, -- additional informaiton we can comment it out later..
              -- diagnostics = { enable = false, },

              -- R: ❌❌❌❌❌❌❌❌ DANGER ❌❌❌❌❌❌❌❌
              --
              --   this line exclude the directlyr of nix/store
              --   so rust-analyzer willnot analyze it, otehrwise if we open STD::<anyting> documents,
              --   analyzer-loadw whole rust language into the memory
              --   *** MEMORY EXPLOSION ***
              files = { excludeDirs = { "/nix/store" } },
            },
          },
        },
      }
    end,
  },
}
