return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Add this to prevent the health check error
    vim.g.fzf_lua_disable_health_check = true
    --DX: This stops healthcheck for fzf (causeing error)
    --comment when error resolves or new version releases

    require("fzf-lua").setup({
      -- Your existing fzf-lua settings (if any)
    })
  end,
}
