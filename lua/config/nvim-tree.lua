-- On attach to buffer, setup custom key mappings
-- Keymappings are meant to follow general vim for consistency.
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- Custom Mappings:
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open in Horizontal Split'))
  vim.keymap.set('n', 'i', api.node.open.vertical, opts('Open in Vertical Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open in New Tab'))
end


require('nvim-tree').setup {
  on_attach = my_on_attach,--M.on_attach,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = false,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  filesystem_watchers = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  renderer = {
    root_folder_label = false,
    icons = {
      padding = " ",
    },
    indent_markers = {
      enable = true,
    },
  },
  tab = {
    sync = {
      close = true,
      ignore = {},
      open = true,
    },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  view = {
    adaptive_size = false,
    side = "right", -- right
    width = 40,
  },
}

-- Theme overrides
--vim.cmd("highlight NvimTreeNormal guibg=#0D1421")
--

require'nvim-web-devicons'.setup {}
