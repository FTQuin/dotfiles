return {
  {
    "ThePrimeagen/99",
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        provider = _99.Providers.ClaudeCodeProvider,

        -- Debug logging per-project
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },

        -- Temporary files stored in repo to avoid permission issues
        -- Must be inside CWD for Claude Code/OpenCode compatibility
        tmp_dir = "./tmp",

        completion = {
          -- Custom SKILL.md files for domain-specific rules
          -- Format: /path/to/dir/<skill_name>/SKILL.md
          custom_rules = {
            "scratch/custom_rules/",
          },

          -- File completion settings use sensible defaults
          files = {},

          -- Built-in completion engine
          source = "native",
        },

        -- Auto-include AGENT.md files from parent directories
        -- Searches from current file up to project root
        md_files = {
          "AGENT.md",
        },
      })

      -- Visual selection generation
      vim.keymap.set("v", "<leader>9", _99.visual, { desc = "99: Generate from visual selection" })

      -- Vibe
      vim.keymap.set("n", "<leader>9v", _99.vibe, { desc = "99: Vibe" })

      -- Search and generation
      vim.keymap.set("n", "<leader>9s", _99.search, { desc = "99: Search codebase" })
      vim.keymap.set("n", "<leader>9o", _99.open, { desc = "99: Open last" })

      -- Request management
      vim.keymap.set("n", "<leader>9x", _99.stop_all_requests, { desc = "99: Cancel all requests" })
      vim.keymap.set("n", "<leader>9l", _99.view_logs, { desc = "99: Show request log" })

      vim.keymap.set("n", "<leader>9t", _99.open_tutorial, { desc = "99: Open tutorial" })
    end,
  },
}
