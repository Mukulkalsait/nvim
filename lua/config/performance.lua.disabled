-- Core performance settings
-- vim.o.ttyfast = true -- Indicates a fast terminal connection
vim.o.updatetime = 100 -- Faster completion and better UI updates
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete
vim.o.redrawtime = 1500 -- Time spent redrawing the screen
vim.o.ttimeoutlen = 10 -- Time in milliseconds to wait for a key code sequence
-- vim.o.wrapscan = false -- Don't wrap searches around the end of file

--Special optimizations.
vim.opt.redrawtime = 1500 -- less time spent redrawing the screen
vim.opt.cursorline = false --disable coursorline :performance
vim.opt.foldmethod = "manual" -- dont sue syntexfolding : speed
-- vim.opt.synmaxcol = 120 -- only highlight first 120 columns

-- Additional optimizations
--vim.o.hidden = true -- dont keep buffers in memory
vim.o.history = 100 -- history size limit.
vim.o.cursorline = false -- Disable cursorline for performance
vim.o.ruler = false -- Disable ruler for performance
vim.o.showcmd = false -- Don't show command in bottom bar
-- vim.o.shell = "/bin/bash" -- Use bash for shell commands (faster than fish/zsh)

-- Memory management
-- vim.o.hidden = false -- Don't keep buffers in memory
vim.o.history = 100 -- Reduce history size

-- Large file handling
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(args)
    local size = vim.fn.getfsize(args.match)
    -- For files larger than 1MB
    if size > 1024 * 1024 then
      vim.cmd("stopinsert")
    end
  end,
})
-- Large file handling
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(args)
    local size = vim.fn.getfsize(args.match)
    if size > 1024 * 1024 then -- 1MB
      vim.wo.foldenable = false
      vim.wo.foldmethod = "manual"
      vim.b.large_file = true
      vim.cmd("syntax off")
      vim.cmd("TSDisable highlight")
    end
  end,
})
