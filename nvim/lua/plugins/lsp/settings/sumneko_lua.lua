return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = "$VIMRUNTIME/lua",
      },
      diagnostics = {
        globals = { "vim" },
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      format = {
        enable = true,
        -- Put format options here
        defaultConfig = {
          indent_style = "space",
          indent_size = "4",
          max_line_length = "unset"
        },
      },
    },
  },
}
