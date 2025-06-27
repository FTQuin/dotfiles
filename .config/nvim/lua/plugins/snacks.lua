-- Configure snacks.nvim with a dashboard header and UI tweaks
return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        git_status_open = true,
      },
      terminal = {
        win = {
          position = "float",
        },
      },
      dashboard = {
        example = "advanced",
        preset = {
          -- ASCII art header
          header = [[
██╗  ██╗███████╗██╗     ██╗      ██████╗      ██████╗ ██╗   ██╗██╗███╗   ██╗
██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ██╔═══██╗██║   ██║██║████╗  ██║
███████║█████╗  ██║     ██║     ██║   ██║    ██║   ██║██║   ██║██║██╔██╗ ██║
██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ██║▄▄ ██║██║   ██║██║██║╚██╗██║
██║  ██║███████╗███████╗███████╗╚██████╔╝    ╚██████╔╝╚██████╔╝██║██║ ╚████║
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝      ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝
]],
        },
      },
    },
  },
}
