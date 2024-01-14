local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local cmake = require("cmake-tools")

function select_cmake_target(opts)
    opts = opts or {}
    opts.cwd = opts.cwd or vim.fn.getcwd()

    local data = cmake.get_cmake_launch_targets()

    pickers.new(opts, {
        prompt_title = 'Select Target',
        finder = finders.new_table {
            results = data.display_targets,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local target = data.targets[selection.index]
                cmake.get_config().build_target = target 
                cmake.get_config().launch_target = target 
            end)
            return true
        end,
    }):find()
end

vim.api.nvim_set_keymap("n", "<leader>rrr", ":lua select_cmake_target()<CR>", opts)
