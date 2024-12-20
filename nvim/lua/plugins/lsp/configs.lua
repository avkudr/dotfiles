local lspconfig = require("lspconfig")

local lsp_servers = require("utils.lsp-servers")

local on_attach = require("plugins.lsp.handlers").on_attach
local capabilities = require("plugins.lsp.handlers").capabilities

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = require("plugins.lsp.settings.sumneko_lua").settings,
})

for _, server in ipairs(lsp_servers.regular_servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- for clangd extension
local icons = require("config.icons")

require("clangd_extensions").setup {
  -- These apply to the default ClangdSetInlayHints command
  inlay_hints = {
    inline = vim.fn.has("nvim-0.10") == 1,
    -- Only show inlay hints for the current line
    only_current_line = true,
    -- Event which triggers a refersh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause  higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = "CursorHold",
    -- whether to show parameter hints with the inlay hints or not
    show_parameter_hints = true,
    -- prefix for parameter hints
    parameter_hints_prefix = "<- ",
    -- prefix for all the other hints (type, chaining)
    other_hints_prefix = "=> ",
    -- whether to align to the length of the longest line in the file
    max_len_align = false,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 7,
    -- The color of the hints
    highlight = "Comment",
    -- The highlight group priority for extmark
    priority = 100,
  },
  ast = {
    -- These require codicons (https://github.com/microsoft/vscode-codicons)
    role_icons = {
      type = "",
      declaration = icons.kind.Method,
      expression = icons.ui.Circle,
      specifier = icons.kind.Specifier,
      statement = icons.kind.Statement,
      ["template argument"] = icons.type.Template,
    },

    kind_icons = {
      Compound = icons.type.Object,
      Recovery = icons.kind.Recovery,
      TranslationUnit = icons.kind.TranslationUnit,
      PackExpansion = icons.kind.PackExpansion,
      TemplateTypeParm = icons.type.Template,
      TemplateTemplateParm = icons.type.Template,
      TemplateParamObject = icons.type.Template,
    },

    highlights = {
      detail = "Comment",
    },
  },
  memory_usage = {
    border = "single",
  },
  symbol_info = {
    border = "single",
  },
}

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
  on_new_config = function(new_config, new_cwd)
    local status, cmake = pcall(require, "cmake-tools")
    if status then
      cmake.clangd_on_new_config(new_config)
    end
  end,
  cmd = require("plugins.lsp.settings.clangd").cmd,
  filetypes = require("plugins.lsp.settings.clangd").filetypes
})

-- python ------------------------------------------------------------------------------------

lspconfig.pyright.setup
{
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end,
}

-- glsl --------------------------------------------------------------------------------------
--
lspconfig.glsl_analyzer.setup {}

-- rust --------------------------------------------------------------------------------------

lspconfig.rust_analyzer.setup{}

