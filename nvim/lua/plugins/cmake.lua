return {
    "avkudr/cmake-mate.nvim",
    dependencies = {
        "stevearc/overseer.nvim"
    },
    config = function()
        local cmake = require("cmake-mate")
        cmake:setup()
    end,
}
