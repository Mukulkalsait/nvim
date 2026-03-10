return {
  "Saecki/crates.nvim",
  event = "BufRead Cargo.toml",
  opts = {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },                            -- <-- opts closes here
  config = function(_, opts)    -- <-- config is a sibling, not inside opts
    local crates = require("crates")
    crates.setup(opts)

    vim.keymap.set("n", "<leader>Ct", crates.toggle,                  { desc = "Toggle crates hints" })
    vim.keymap.set("n", "<leader>Cr", crates.reload,                  { desc = "Reload crates" })
    vim.keymap.set("n", "<leader>Ci", crates.show_popup,              { desc = "Show crate info" })
    vim.keymap.set("n", "<leader>Cv", crates.show_versions_popup,     { desc = "Show versions" })
    vim.keymap.set("n", "<leader>Cf", crates.show_features_popup,     { desc = "Show features" })
    vim.keymap.set("n", "<leader>Cd", crates.show_dependencies_popup, { desc = "Show dependencies" })
    vim.keymap.set("n", "<leader>Cu", crates.update_crate,            { desc = "Update crate" })
    vim.keymap.set("v", "<leader>Cu", crates.update_crates,           { desc = "Update selected crates" })
    vim.keymap.set("n", "<leader>CU", crates.update_all_crates,       { desc = "Update ALL crates" })
    vim.keymap.set("n", "<leader>Cx", crates.upgrade_crate,           { desc = "Upgrade crate" })
    vim.keymap.set("v", "<leader>Cx", crates.upgrade_crates,          { desc = "Upgrade selected crates" })
    vim.keymap.set("n", "<leader>CX", crates.upgrade_all_crates,      { desc = "Upgrade ALL crates" })
    vim.keymap.set("n", "<leader>Co", crates.open_crates_io,          { desc = "Open crates.io" })
    vim.keymap.set("n", "<leader>Cg", crates.open_repository,         { desc = "Open repository" })
    vim.keymap.set("n", "<leader>Cp", crates.open_documentation,      { desc = "Open docs.rs" })
  end,
}
