return {
    dir = "~/nvim-cmake",
    branch = "main",
    dependencies = {
        "stevearc/overseer.nvim"
    },
    config = function()
        local cmake = require("nvim-cmake")
        cmake:setup()
    end,
}
