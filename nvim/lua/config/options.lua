local options = {
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  hlsearch = true, -- highlight all matches on previous search pattern
  incsearch = true, -- enable incsearch
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- case insensitive searching UNLESS /C or capital in search
  relativenumber = true, -- set relative numbered lines
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  wrap = false,
  tabstop = 4, -- insert 4 spaces for a tab
  softtabstop = 4,
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  expandtab = true, -- convert tabs to spaces
  autoindent = true,
  smartindent = true, -- make indenting smarter again
  termguicolors = true, -- set term gui colors (most terminals support this)
  scrolloff = 8,
  signcolumn = "yes",
  updatetime = 200, -- faster completion (4000ms default)
  colorcolumn = "95",
  mouse = "a", -- allow the mouse to be used in neovim
  breakindent = true,
  undofile = true, -- save undo history
  laststatus = 3, -- make sure that lualine is shown only once 
  pumheight = 12, -- max number of results when doing autocomplete
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
