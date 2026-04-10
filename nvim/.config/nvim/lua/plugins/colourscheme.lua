-- Set custom light/dark themes based on background
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {},
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    opts = {
      options = {
        transparent = true,
      },
      groups = {
        all = {
          StatusLine = { bg = "NONE" },
          StatusLineNC = { bg = "NONE" },
          TabLine = { bg = "NONE" },
          TabLineFill = { bg = "NONE" },
          TabLineSel = { bg = "NONE" },
        },
      },
    },
  },
  {
    "sainnhe/edge",
    name = "edge-theme",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_high_contrast",
    },
  },
}
