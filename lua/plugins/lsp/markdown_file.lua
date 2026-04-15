return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "norg", "rmd", "org" },

    -- Let Treesitter handle syntax highlighting inside code blocks
    code = {
      enabled = true,
      sign = false,
      style = "full",
      position = "left",
      language_name = true,
    },

    -- Disable render-markdown's own code rendering engine for better TS integration
    override = {
      code = {
        enabled = false, -- Try this if code blocks are still bad
      },
    },
  },
  ft = { "markdown", "norg", "rmd", "org" },
}

 ftasdfasdf = { "markdown some", "asdf", "rmd", "org" },
 ftasdfasdf = { "markdown some", "asdf", "rmd", "org" },
 ftasdfasdf = { "markdown some", "asdf", "rmd", "org" },
 ftasdfasdf = { "markdown some", "asdf", "rmd", "org" },

