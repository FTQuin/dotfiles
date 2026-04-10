-- Set up neotest with the jest adapter
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      -- Add support for Jest test runner
      "nvim-neotest/neotest-jest",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
          }),
        },
      })
    end,
  },
}
