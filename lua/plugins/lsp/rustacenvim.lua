return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  opts = {
    tools = {
      crate_graph = {
        backend = "svg",
        output = "crate-graph.svg",
      },
      test_runner = "nextest", -- Y: added for nextest running direclty tests
    },
    server = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
        },
      },
    },
  },
  config = function(_, opts)
    -- Setup rustaceanvim with options
    vim.g.rustaceanvim = opts

    -- Which-key registration (global, but only shows in Rust files)
    local wk = require("which-key")
    wk.add({ { "<leader>R", group = "Rust", icon = "🦀" } })

    -- Keymaps (these will work everywhere but only make sense in Rust files)
    vim.keymap.set("n", "<leader>Rr", ":RustLsp runnables<CR>", { desc = "🏃 Show Runnables" })
    vim.keymap.set("n", "<leader>Rt", ":RustLsp testables<CR>", { desc = "🧪 Show Testables" })
    vim.keymap.set("n", "<leader>Ra", ":RustLsp run<CR>", { desc = "▶️ Run current" })
    vim.keymap.set("n", "<leader>Rd", ":RustLsp debuggables<CR>", { desc = "🐛 Show Debuggables" })
    vim.keymap.set("n", "<leader>Re", ":RustLsp explainError<CR>", { desc = "📖 Explain Error" })
    vim.keymap.set("n", "<leader>Rm", ":RustLsp expandMacro<CR>", { desc = "🔍 Expand Macro" })
    vim.keymap.set("n", "<leader>Rc", ":RustLsp codeAction<CR>", { desc = "⚡ Code Actions" })
    vim.keymap.set("n", "<leader>Rg", ":RustLsp crateGraph<CR>", { desc = "📊 Crate Graph" })
    vim.keymap.set("n", "<leader>Ro", ":RustLsp openDocs<CR>", { desc = "📚 Open Docs" })
    vim.keymap.set("n", "<leader>Rs", ":RustLsp syntaxTree<CR>", { desc = "🌲 Syntax Tree" })
    vim.keymap.set("n", "<leader>Rh", ":RustLsp viewHir<CR>", { desc = "🔬 View HIR" })
    vim.keymap.set("n", "<leader>Rl", ":RustLsp reloadWorkspace<CR>", { desc = "🔄 Reload Workspace" })
  end,
}
