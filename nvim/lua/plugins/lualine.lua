return {
  "nvim-lualine/lualine.nvim", -- status line
  lazy = false,
  priority = 900,
  dependencies = {
  },
  config = function()
    local lualine = require("lualine")

    -- Credited to [evil_lualine](https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua)
    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local cmake = require('cmake-mate')

    -- stylua: ignore start
    local c = require('onedark.colors')
    local cfg = vim.g.onedark_config
    local colors = {
        bg = c.bg0,
        fg = c.fg,
        red = c.red,
        green = c.green,
        yellow = c.yellow,
        blue = c.blue,
        purple = c.purple,
        cyan = c.cyan,
        gray = c.grey
    }

    local one_dark = {
        inactive = {
            a = {fg = colors.gray, bg = colors.bg, gui = 'bold'},
            b = {fg = colors.gray, bg = colors.bg},
            c = {fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1},
        },
        normal = {
            a = {fg = colors.bg, bg = colors.green, gui = 'bold'},
            b = {fg = colors.fg, bg = c.bg3},
            c = {fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1},
        },
        visual = {a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}},
        replace = {a = {fg = colors.bg, bg = colors.red, gui = 'bold'}},
        insert = {a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}},
        command = {a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'}},
        terminal = {a = {fg = colors.bg, bg = colors.cyan, gui = 'bold'}},
    }

    local config = {
      options = {
        icons_enabled = true,
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { "alpha", "dashboard", "Outline" },
        always_divide_middle = true,
        theme = one_dark,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- c for left
        lualine_c = {},
        -- x for right
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
      },
      tabline = {},
      extensions = {},
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.fg, gui = "bold" },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return "%="
      end,
    }

    ins_right {
      "searchcount"
    }

    ins_right {
        function()
            return cmake.get_current_target_name()
        end,
        color = { fg = colors.fg, gui = "bold" }
    }

    -- Add components to right sections
    ins_right {
      function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end,
      color = { fg = colors.fg, gui = "bold" }
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end
}
