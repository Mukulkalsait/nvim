return
 {
  "christoomey/vim-tmux-navigator",
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>" },
  },
-- cmd = {
--   "TmuxNavigateLeft", "TmuxNavigateDown",
--   "TmuxNavigateUp", "TmuxNavigateRight",
-- },
}


-- { 'alexghergh/nvim-tmux-navigation', config = function()
--     local nvim_tmux_nav = require('nvim-tmux-navigation')
--     nvim_tmux_nav.setup {
--         disable_when_zoomed = true,
--         -- keybindings = {
--         --     left = "<C-h>",
--         --     down = "<C-j>",
--         --     up = "<C-k>",
--         --     right = "<C-l>",
--         --     last_active = "<C-\\>",
--         --     next = "<C-Space>",
--         -- }
--     }
-- end
-- }

