return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "java",
    config = function()
      local jdtls = require("jdtls")

      -- Determine workspace directory
      local home = os.getenv("HOME")
      local workspace_dir = home .. "/.cache/jdtls/workspace"

      -- Detect project root
      local root_markers = { "gradlew", ".git", "mvnw", "pom.xml" }
      local root_dir = require("jdtls.setup").find_root(root_markers)

      -- Mason paths
      local mason_install_dir = home .. "/.local/share/nvim/mason"
      local jdtls_install_dir = mason_install_dir .. "/packages/jdtls"

      -- Java executable path (adjust as needed)
      local java_exe = vim.fn.glob(mason_install_dir .. "/packages/jdk-17/bin/java")
      if java_exe == "" then
        java_exe = "java" -- Fallback to system Java
      end

      -- Bundles for debugging and testing
      local bundles = {}
      local java_test_bundle = vim.fn.glob(mason_install_dir .. "/packages/java-test/extension/server/*.jar")
      local java_debug_bundle = vim.fn.glob(
        mason_install_dir .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
      )

      if java_test_bundle ~= "" then
        table.insert(bundles, java_test_bundle)
      end
      if java_debug_bundle ~= "" then
        table.insert(bundles, java_debug_bundle)
      end

      local function make_capabilities()
        return vim.lsp.protocol.make_client_capabilities()
      end

      local config = {
        -- Executable
        cmd = {
          java_exe,
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1G",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",

          "-jar",
          vim.fn.glob(jdtls_install_dir .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          jdtls_install_dir .. "/config_linux",
          "-data",
          workspace_dir,
        },

        -- Root directory of the project
        root_dir = root_dir,

        -- Language server capabilities
        capabilities = make_capabilities(),

        -- On attach function
        on_attach = function(client, bufnr)
          -- Custom keymaps and other on_attach logic
          jdtls.setup_dap({ hotcodereplace = "auto" })

          -- Add your custom keymaps here
          local opts = { buffer = bufnr, silent = true }
          vim.keymap.set(
            "n",
            "<leader>jo",
            jdtls.organize_imports,
            vim.tbl_extend("force", opts, { desc = "Organize Imports" })
          )
          vim.keymap.set(
            "n",
            "<leader>jv",
            jdtls.extract_variable,
            vim.tbl_extend("force", opts, { desc = "Extract Variable" })
          )
        end,

        -- Extended initialization options
        init_options = {
          bundles = bundles,
        },

        -- Server settings
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = java_exe:gsub("/bin/java$", ""),
                  default = true,
                },
              },
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            references = {
              includeDecompiledSources = true,
            },
          },
        },
      }

      -- Create autocommand to start JDTLS
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- Safely start or attach JDTLS
          pcall(function()
            jdtls.start_or_attach(config)
          end)
        end,
      })
    end,
  },

  -- Ensure Mason installs required packages
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "jdtls",
        "java-test",
        "java-debug-adapter",
      })
    end,
  },
}
