return {
  cmd = {
    "clangd",
    "--pretty",
    "--background-index",
    "--clang-tidy",
    "--completion-style=bundled",
    "--cross-file-rename",
    "--header-insertion=never",
    "--suggest-missing-includes",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true
  },
  flags = { debounce_text_changes = 150 },
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda"}, 
}
