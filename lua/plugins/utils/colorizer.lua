-- B: NIXOS VERSION
return {
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "typescript" , "rust"})
    end,
  },
}
