return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    local neotest = require 'neotest'

    -- Setup neotest with adapters
    neotest.setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
      },
    }
    -- Add keymaps for neotest
    vim.keymap.set('n', '<leader>tt', function()
      neotest.run.run()
    end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Run all tests in file' })
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open()
    end, { desc = 'Open test output' })
    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.toggle()
    end, { desc = 'Toggle test summary' })
  end,
}
