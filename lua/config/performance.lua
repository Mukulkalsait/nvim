-- Core performance settings
vim.o.ttyfast = true -- Indicates a fast terminal connection
vim.o.updatetime = 100 -- Faster completion and better UI updates
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete
vim.o.redrawtime = 1500 -- Time spent redrawing the screen
vim.o.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence
vim.o.wrapscan = false -- Don't wrap searches around the end of file

-- Additional optimizations
vim.o.cursorline = false -- Disable cursorline for performance
vim.o.ruler = false -- Disable ruler for performance
vim.o.showcmd = false -- Don't show command in bottom bar
-- vim.o.shell = "/bin/bash" -- Use bash for shell commands (faster than fish/zsh)

-- Memory management
vim.o.hidden = false -- Don't keep buffers in memory
vim.o.history = 100 -- Reduce history size
