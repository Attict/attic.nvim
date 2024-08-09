local highlight = {
    "Comment",
}

local highlight = {
    "IBLColor",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IBLColor", { fg = "#282d39" })
end)


local options = {
  --indent = { highlight = highlight, char = "." },
  indent = { highlight = highlight },
  --whitespace = {
  --  highlight = highlight,
  --  remove_blankline_trail = false,
  --},
  --scope = { enabled = false },

  --indentLine_enabled = 1,
  --filetype_exclude = {
  --  "help",
  --  "terminal",
  --  "packer",
  --  "lspinfo",
  --  "TelescopePrompt",
  --  "TelescopeResults",
  --  "lsp-installer",
  --  "",
  --},
  --buftype_exclude = { "terminal" },
  --show_trailing_blankline_indent = true,
  --show_first_indent_level = true,
  --show_current_context = true,
  --show_current_context_start = false,
  --show_end_of_line = true,
}

require("ibl").setup(options)
