return {
    "hrsh7th/nvim-cmp",           -- The completion plugin
    dependencies = {
        "hrsh7th/cmp-buffer",       -- buffer completions
        "hrsh7th/cmp-path",         -- path completions
        "hrsh7th/cmp-cmdline",      -- cmdline completions
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",

        -- Snippets
        "hrsh7th/cmp-vsnip", 
        "hrsh7th/vim-vsnip",  
    },
    config = function()
        local cmp = require("cmp")

        local kind_icons = require("config.icons").kind

        local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end

        local winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None"
        -- find more here: https://www.nerdfonts.com/cheat-sheet

        cmp.setup {
            enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            end,
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                end,
            },
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            view = {
                entries = {name = "custom"}
            },
            mapping = {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                max_width = 0,
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                    -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    -- This concatonates the icons with the name of the item kind
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = 'vsnip' },
                { name = "path" },
                { name = "buffer" },
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                completion = { scrollbar = true, },
                documentation = { winhighlight = winhighlight },
            }
        }
    end
}
