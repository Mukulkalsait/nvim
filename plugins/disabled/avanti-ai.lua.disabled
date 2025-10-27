-- .config/nvim/lua/plugins/avante-ai.lua
return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua", -- Added copilot.lua dependency
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
    build = "make",
    config = function()
      -- Setup copilot first
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })

      local opts = { provider = "copilot" }

      -- Check for OpenAI API environment variables
      local openai_api_url = os.getenv("OPENAI_API_CHAT_COMPLETIONS")
      if openai_api_url then
        opts.provider = "openai"
        opts.openai = {
          endpoint = openai_api_url,
          model = "anthropic:claude-3-5-sonnet",
          timeout = 30000,
          temperature = 0,
          max_tokens = 4096,
          ["local"] = false,
        }
      end

      -- Initialize Avante
      require("avante").setup(opts)

      -- Set up keymaps
      local keymap = vim.keymap.set
      local avante = require("avante")

      -- Basic keybindings
      keymap("n", "<leader>aa", avante.toggle, { desc = "Toggle Avante AI" })
      keymap("n", "<leader>ae", avante.explain_code, { desc = "Explain Code" })
      keymap("n", "<leader>af", avante.fix_code, { desc = "Fix Code" })
      keymap("n", "<leader>ar", avante.refactor_code, { desc = "Refactor Code" })
      keymap("n", "<leader>ad", avante.document_code, { desc = "Document Code" })
      keymap("n", "<leader>at", avante.generate_tests, { desc = "Generate Tests" })

      -- Visual mode keybindings for selected code
      keymap("v", "<leader>ae", avante.explain_code, { desc = "Explain Selected Code" })
      keymap("v", "<leader>af", avante.fix_code, { desc = "Fix Selected Code" })
      keymap("v", "<leader>ar", avante.refactor_code, { desc = "Refactor Selected Code" })
      keymap("v", "<leader>ad", avante.document_code, { desc = "Document Selected Code" })
      keymap("v", "<leader>at", avante.generate_tests, { desc = "Generate Tests for Selected Code" })
    end,
  },
}
