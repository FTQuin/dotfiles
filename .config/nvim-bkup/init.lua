-- [[ Basic Vim Settings ]]
require 'vim-settings'

-- [[ Basic Keymaps ]]
require 'keymaps' -- recommend keymaps

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy

require('lazy').setup({
  -- A collection of small QoL plugins for Neovim
  require 'plugins.snacks',

  -- Run tests like Jest
  require 'plugins.neotest',

  -- Show what functions and/or statements the current line is in
  { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  require 'plugins.which-key',

  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope',

  -- LSP Plugins
  require 'plugins.lsp',

  -- Autoformat
  require 'plugins.conform',

  -- Autocompletion
  require 'plugins.nvim-cmp',

  -- colour scheme
  require 'plugins.colours.tokyonight',

  -- Collection of various small independent plugins/modules
  -- includes:
  --    ai
  --    surround
  --    statusline
  require 'plugins.mini',

  -- Highlight, edit, and navigate code
  require 'plugins.nvim-treesitter',

  require 'plugins.debug',
  require 'plugins.indent_line',
  require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',

  -- adds gitsigns recommend keymaps
  require 'plugins.gitsigns',
}, {
  ui = {
    icons = {},
  },
})
