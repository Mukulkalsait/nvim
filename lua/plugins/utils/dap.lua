-- ~/.config/nvim/lua/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- required by dap-ui
      "jay-babu/mason-nvim-dap.nvim", -- auto installs debug adapters
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "Continue / Start" },
      { "<leader>di", function() require("dap").step_into() end,         desc = "Step Into" },
      { "<leader>do", function() require("dap").step_over() end,         desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end,          desc = "Step Out" },
      { "<leader>dt", function() require("dap").terminate() end,         desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end,          desc = "Toggle DAP UI" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()

      -- auto open/close UI when debugging starts/ends
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end

      dap.adapters["lldb-dap"] = {
        type = "executable",
        command = "lldb-dap",
      }


      dap.configurations.rust = {
      {
        name = "Launch",
        type = "lldb-dap",
        request = "launch",
        program = function()
          local metadata = vim.fn.system("cargo metadata --no-deps --format-version 1")
          local parsed = vim.fn.json_decode(metadata)
          local target_dir = parsed.target_directory
          local bin_name = parsed.packages[1].name
          return target_dir .. "/debug/" .. bin_name
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        -- add these two lines: Y: ERROR BY THIS 2 LINES
        initCommands = { "command script import /run/current-system/sw/lib/rustlib/etc/lldb_lookup.py" },
        sourceLanguages = { "rust" },
      },
    }
    end,
  },
}

-- Y: 
-- ```md
-- | Key | Action |
-- |-----|--------|
-- | `<leader>db` | Toggle breakpoint |
-- | `<leader>dc` | Start / Continue |
-- | `<leader>di` | Step into |
-- | `<leader>do` | Step over |
-- | `<leader>dO` | Step out |
-- | `<leader>dt` | Terminate |
-- | `<leader>du` | Toggle UI |
-- ```
