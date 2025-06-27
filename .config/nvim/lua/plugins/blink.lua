-- Configure blink.cmp plugin with custom keymaps
return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Use Ctrl+f to accept completion
        ["<C-f>"] = { "select_and_accept" },
        -- Disable Enter key for completions
        ["<CR>"] = {},
      },
    },
  },
}
