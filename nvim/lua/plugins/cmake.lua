return {
    dir = "~/nvim-cmake",
    branch = "main",
    dependencies = {
    },
    config = function()
        local cmake = require("nvim-cmake")
        cmake:setup()
    end,
}
