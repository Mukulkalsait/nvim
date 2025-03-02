local jdtls = require("jdtls")
local home = os.getenv("HOME")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local mason_install_dir = home .. "/.local/share/nvim/mason"
local jdtls_install_dir = mason_install_dir .. "/packages/jdtls"

-- Java executable path
local java_exe = vim.fn.glob(mason_install_dir .. "/packages/jdk-17/bin/java")
if java_exe == "" then
  java_exe = "java" -- Fallback to system Java
end

-- Project detection
local root_markers = { "gradlew", ".git", "mvnw", "pom.xml" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  root_dir = vim.fn.getcwd()
end

-- Bundles setup for debugging
local bundles = {}
local java_test_bundle = vim.fn.glob(mason_install_dir .. "/packages/java-test/extension/server/*.jar", true)
local java_debug_bundle = vim.fn.glob(
  mason_install_dir .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
  true
)

if java_test_bundle ~= "" then
  vim.list_extend(bundles, vim.split(java_test_bundle, "\n"))
end

if java_debug_bundle ~= "" then
  vim.list_extend(bundles, vim.split(java_debug_bundle, "\n"))
end

-- Setup configuration
local config = {
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
  root_dir = root_dir,
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
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      references = { includeDecompiledSources = true },
      format = { enabled = true },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  init_options = {
    bundles = bundles,
  },
  on_attach = function(client, bufnr)
    -- Set up keymaps
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
    vim.keymap.set("n", "<leader>jm", jdtls.extract_method, vim.tbl_extend("force", opts, { desc = "Extract Method" }))

    -- Setup DAP
    jdtls.setup_dap({ hotcodereplace = "auto" })

    -- Let LazyVim's LSP configuration handle the rest
    require("lazyvim.util").on_attach(function(_, buffer)
      vim.api.nvim_buf_set_option(buffer, "formatexpr", "v:lua.require'jdtls'.format")
    end)
  end,
}

-- Start JDTLS
jdtls.start_or_attach(config)
