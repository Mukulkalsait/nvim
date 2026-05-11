vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site") -- GIVES SOME EXTRA NIX INFO TO VIM.
vim.env.PATH = "/run/current-system/sw/bin:" .. vim.env.PATH  -- gives path of nix installed tree-sitter Y: WORKS AWESOME.

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme "oxocarbon"
vim.cmd("colorscheme tokyonight-night") -- Replace 'tokyonight' with your desired theme
-- vim.cmd("colorscheme catppuccin") -- Replace 'tokyonight' with your desired theme

vim.o.signcolumn = "yes" -- Show sign column for diagnostics
vim.o.updatetime = 250 -- Update delay for diagnostics
vim.opt.clipboard = "unnamedplus" -- Load performance optimizations

require("config.performance") -- vim.filetype.add({ extension = { rgvp = "php" } })


-- Y: Automatic change the theme on langauge... 
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function()
--     vim.cmd("colorscheme tokyonight-night")
--   end,
-- })



