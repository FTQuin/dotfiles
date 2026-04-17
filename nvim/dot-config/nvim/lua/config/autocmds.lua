-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)

-- local autocmd = vim.api.nvim_create_autocmd
--
-- -- Add your background/theme toggle here
-- autocmd("OptionSet", {
--   pattern = "background",
--   callback = function()
--     local ok, _ =
--       pcall(vim.cmd.colorscheme, vim.o.background == "dark" and "tokyonight" or "github_light_high_contrast")
--     if not ok then
--       return
--     end
--   end,
-- })
--

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
--   end,
-- })

-- Fix for transparency and theme persistence on toggle
vim.api.nvim_create_autocmd({ "OptionSet" }, {
  pattern = { "*", "background" },
  callback = function()
    -- Re-apply transparency overrides
    local hl_groups = { "Normal", "NormalFloat" }
    for _, group in ipairs(hl_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end
  end,
})
