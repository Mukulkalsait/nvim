return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    file_types = { "markdown", "norg", "rmd", "org" },
    -- Add these to render markdown in special buffers:
    overrides = {
      buftype = {
        ["nofile"] = {
          enabled = true,  -- enables rendering in hover/float windows
        },
      },
    },
  },
  ft = { "markdown", "norg", "rmd", "org" },
}

--R: RUN TSInstall markdown markdown_inline
