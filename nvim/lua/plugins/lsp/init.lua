return {
    "williamboman/mason.nvim",
    priority = 900,
    opts = {
        inlay_hints = { enabled = true },
    },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "p00f/clangd_extensions.nvim", -- clangd extension, some good stuff
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "glsl_analyzer", "clangd", "neocmake", "lua_ls", "rust_analyzer" },
        }

        require "plugins.lsp.configs"
        require("plugins.lsp.handlers").setup()
    end
}
