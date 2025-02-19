return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     -- Remove any existing jdtls setup in this section
  --     servers = {
  --       jdtls = { enabled = false }, -- Disable default JDTLS setup
  --     },
  --   },
  -- },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local jdtls = require("jdtls")

      -- Determine OS-specific config
      local home = os.getenv("HOME")
      local workspace_dir = home .. "/.cache/jdtls/workspace"

      -- Java specific path configurations
      local java_home = os.getenv("JAVA_HOME") or "/usr/lib/jvm/java-17-openjdk"
      local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
      local lombok_path = jdtls_path .. "/lombok.jar"

      -- Determine the root of the project
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)

      -- Eclipse JDT Language Server configuration
      local config = {
        flags = {
          debounce_text_changes = 80,
        },
        on_attach = function(client, bufnr)
          jdtls.setup_dap({ hotcodereplace = "auto" })

          -- Custom keymaps
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
          vim.keymap.set(
            "n",
            "<leader>jc",
            jdtls.extract_constant,
            vim.tbl_extend("force", opts, { desc = "Extract Constant" })
          )
          vim.keymap.set(
            "v",
            "<leader>jm",
            "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
            vim.tbl_extend("force", opts, { desc = "Extract Method" })
          )
        end,

        -- Java-specific server configuration
        cmd = {
          java_home .. "/bin/java",
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
          jdtls_path .. "/plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar",
          "-configuration",
          jdtls_path .. "/config_linux",
          "-data",
          workspace_dir,
        },

        -- Workspace configuration
        root_dir = root_dir,

        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = java_home,
                  default = true,
                },
              },
            },
            import = {
              gradle = { enabled = true },
              maven = { enabled = true },
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

        -- Lombok support
        init_options = {
          bundles = {
            vim.fn.glob(lombok_path),
          },
        },
      }

      -- Create an augroup to handle Java filetype
      vim.api.nvim_create_augroup("JavaLSP", { clear = true })

      -- Attach JDTLS when a Java file is opened
      vim.api.nvim_create_autocmd("FileType", {
        group = "JavaLSP",
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

  -- Optional: DAP configuration for Java debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "java-debug-adapter")
          table.insert(opts.ensure_installed, "java-test")
        end,
      },
    },
    config = function()
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "localhost",
          port = 5005,
        },
        {
          type = "java",
          request = "launch",
          name = "Debug (Launch) - Current File",
          mainClass = function()
            return vim.fn.input("Main class name: ")
          end,
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
}
