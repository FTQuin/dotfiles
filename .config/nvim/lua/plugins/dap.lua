-- Configure DAP (Debug Adapter Protocol) with support for JS/TS debugging
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- DAP UI
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",

      -- Adapter manager
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",

      -- Language-specific adapters
      "leoluz/nvim-dap-go",
      "mxsdev/nvim-dap-vscode-js",
      "microsoft/vscode-js-debug",
    },
    config = function()
      -- Setup mason-dap integration if present
      if LazyVim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      end

      -- Highlight the current line on breakpoint
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Setup signs/icons for breakpoints
      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end

      -- JSON decoding for VSCode launch config
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      local dap = require("dap")

      -- Load launch.json configs
      vscode.load_launchjs(nil, { node = { "node2", "pwa-node" } })

      -- Define adapters
      dap.adapters.node2 = {
        type = "executable",
        command = "node-debug2-adapter",
        args = {},
      }

      dap.adapters["pwa-node"] = {
        type = "executable",
        command = "js-debug-adapter",
        args = {},
      }

      -- Configure vscode-js-debug
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      })
    end,
  },
}
