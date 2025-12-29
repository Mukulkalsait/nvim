return {
  "mrcjkb/rustaceanvim",
  version = "^6",  -- Use latest stable
  ft = { "rust" },
  opts = {
    server = {
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            buildScripts = { enable = true },
            loadOutDirsFromCheck = true,
          },
          check = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          checkOnSave = true,
          diagnostics = { enable = true },
          files = {
            excludeDirs = { ".direnv", ".git", ".github", ".gitlab", "bin", "node_modules", "target", "venv", ".venv" },
          },
          procMacro = { enable = true },
          rust = {
            analyzerTargetDir = true,
            linkedProjects = { "Cargo.toml" },  -- Explicitly link to Cargo.toml for your project
          },
        },
      },
      cmd = { "rust-analyzer" },  -- Use Nix-installed rust-analyzer
    },
    -- Optional: Enable inlay hints, testing, etc.
    tools = {
      inlay_hints = { auto = true },
    },
  },
}

