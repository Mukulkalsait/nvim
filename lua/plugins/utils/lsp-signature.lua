-- ~/.config/nvim/lua/plugins/lsp-signature.lua
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = { border = "rounded" },
    hint_enable = true,
    hint_prefix = "󰏚 ",
    floating_window = true,
    auto_close_after = 5,
  },
}
