return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = function()
        local theme = require("lualine.themes.auto")
        for _, mode in pairs(theme) do
          for key, section in pairs(mode) do
            if type(section) == "table" then
              -- Sections a and z have bright bg + dark fg (reversed look).
              -- Swap so the bright color becomes the fg on a transparent bg.
              if key == "a" or key == "z" then
                section.fg = section.bg or section.fg
              end
              section.bg = "NONE"
              section.gui = nil
            end
          end
        end
        return theme
      end
    end,
  },
}
