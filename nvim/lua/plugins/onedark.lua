return {
    'navarasu/onedark.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require('onedark').setup {
            style = 'darker',
            -- Custom Highlights --
            highlights = {
                ["comments"] = {fg = '$light_grey', bg = none, fmt = 'none'},
                ["@comment"] = {fg = '$light_grey', bg = none, fmt = 'none'},
                ["@constructor"] = {fmt = 'none'},
            }, -- Override highlight groups
        }
        require('onedark').load()
    end,
}
