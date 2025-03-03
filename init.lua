-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd("colorscheme tokyonight-night") -- Replace 'tokyonight' with your desired theme
vim.cmd("colorscheme cyberdream") -- Replace 'tokyonight' with your desired theme
vim.o.signcolumn = "yes" -- Show sign column for diagnostics
vim.o.updatetime = 250 -- Update delay for diagnostics
-- Load performance optimizations
require("config.performance")
