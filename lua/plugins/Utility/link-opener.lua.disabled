-- lua/plugins/link-opener.lua
return {
  {
    "LazyVim/LazyVim",
    keys = {
      -- Explicitly define gx mapping without overwriting other existing mappings
      {
        "gx",
        function()
          local url = vim.fn.expand("<cfile>")
          if url:match("^https?://") then
            vim.fn.system("wslview " .. vim.fn.shellescape(url))
            print("Opened: " .. url)
          else
            print("No valid URL found")
          end
        end,
        desc = "Open URL with wslview",
        mode = "n",
      },
    },
  },
}
--WARN: :  wslview Must be installed.
--sudo nala update
--sudo nala install wslu
