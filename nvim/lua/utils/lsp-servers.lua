local M = {}

M.all_servers = {
  -- "jsonls",
  "lua_ls",
  "clangd",
  "hls",
  "prosemd_lsp",
  "cssls",
  "rust_analyzer",
  "vuels",
  "ts_ls",
  "texlab",
  "angularls",
  "eslint",
  "pyright",
  "cmake"
}

M.regular_servers = {
  "prosemd_lsp",
  "cssls",
  "vuels",
  "ts_ls",
  "texlab",
  "angularls",
  "eslint",
  "pyright",
  "cmake"
}

return M
