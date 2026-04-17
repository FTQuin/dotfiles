return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Keymaps
      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end, { desc = "Harpoon: Add file" })
      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon: Toggle menu" })

      -- Navigate to files
      for i = 1, 8 do
        vim.keymap.set("n", "<leader>" .. i, function()
          harpoon:list():select(i)
        end, { desc = "Harpoon: Go to file " .. i })
      end

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "Harpoon: Previous file" })
      vim.keymap.set("n", "<leader>hn", function()
        harpoon:list():next()
      end, { desc = "Harpoon: Next file" })
    end,
  },
}
