-- B: NIXOS VERSION | General Version Working Perfectly
return {
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "typescript" , "rust"})
    end,
  },
}
