-- Set custom light/dark themes based on background
return {
  {
    "ember-theme/nvim",
    name = "ember",
    priority = 1000,
    opts = {
      transparent = true, -- transparent editor background
      transparent_floats = true, -- follows `transparent` by default; set explicitly to override
    },
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- Tab line
          TabLine = { bg = "none" },
          TabLineFill = { bg = "none" },
          TabLineSel = { bg = "none" },
          -- Status line (lualine)
          StatusLine = { bg = "none" },
          StatusLineNC = { bg = "none" },
          -- Line numbers and sign column
          LineNr = { bg = "none" },
          SignColumn = { bg = "none" },
          -- Git signs
          GitSignsAdd = { bg = "none" },
          GitSignsChange = { bg = "none" },
          GitSignsDelete = { bg = "none" },
          -- Diagnostic signs (warnings, errors, hints, info)
          DiagnosticSignError = { bg = "none" },
          DiagnosticSignWarn = { bg = "none" },
          DiagnosticSignInfo = { bg = "none" },
          DiagnosticSignHint = { bg = "none" },
          -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {},
  --   },
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  -- },
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   opts = {
  --     options = {
  --       transparent = true,
  --     },
  --     groups = {
  --       all = {
  --         StatusLine = { bg = "NONE" },
  --         StatusLineNC = { bg = "NONE" },
  --         TabLine = { bg = "NONE" },
  --         TabLineFill = { bg = "NONE" },
  --         TabLineSel = { bg = "NONE" },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "sainnhe/edge",
  --   name = "edge-theme",
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
