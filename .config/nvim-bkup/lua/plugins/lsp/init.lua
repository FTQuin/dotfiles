return {
  -- Main LSP Configuration
  -- includes:
  --   williamboman/mason.nvim
  --   williamboman/mason-lspconfig.nvim
  --   WhoIsSethDaniel/mason-tool-installer.nvim
  --   j-hui/fidget.nvim
  require 'plugins.lsp.nvim-lspconfig',

  -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  require 'plugins.lsp.lazydev',

  -- collection of definition files for the framework Luvit.
  { 'Bilal2453/luvit-meta', lazy = true },
}
