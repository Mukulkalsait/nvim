<!-- --Y: plugins/mason-tool-installer.lua (or part of LazyVim custom plugins) -->
<!-- -- Make sure to install this things via BUN or PNPM in future installations. -->
<!-- -- pnpm add -g prettier eslint_d stylelint -->
<!-- -- # or -->
<!-- -- bun add -g prettier eslint_d stylelint -->

return {
"WhoIsSethDaniel/mason-tool-installer.nvim",
opts = {
ensure_installed = {
"lua-language-server",
"php-debug-adapter",
"phpcs",
"tailwindcss-language-server",
"prettier",
"rust-analyzer",
"angular-language-server",
"codelldb",
"css-lsp",
"emmet-ls",
"eslint-lsp",
"html-lsp",
"java-debug-adapter",
"java-test",
"jdtls",
"js-debug-adapter",
"json-lsp",
"php-cs-fixer",
"phpactor",
"shfmt",
"sqlfluff",
"sqlls",
"stylelint-lsp",
"stylua",
"taplo",
"typescript-language-server",
"vtsls",
},
auto_update = false,
run_on_start = true,
},
}
