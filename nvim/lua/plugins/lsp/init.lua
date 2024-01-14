return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = true },
  },
  dependencies = {
    "p00f/clangd_extensions.nvim", -- clangd extension, some good stuff
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
  },
  config = function()
    require "plugins.lsp.configs"
    require("plugins.lsp.handlers").setup()
  end
}
