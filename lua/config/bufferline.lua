local options = {
  indicator = {
    style = 'icon',
    icon = '▋'
  },
  separator_style = 'thick', --{'', ''},
  buffer_close_icon = '',
  modified_icon = '●',
  close_icon = '',
  left_trunc_marker = '',
  right_trunc_marker = '',
  max_name_length = 20,
  max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
  tab_size = 22,
  show_buffer_close_icons = false,
  show_close_icon = false,
  always_show_bufferline = true,

  -- EW
  mode = 'tabs', -- tabs | buffer
  sort_by = 'tabs',

  --sort_by = 'tabs',
  --enforce_regular_tabs = true,
  --sort_by = 'insert_at_end',
  offsets = {
    {
      filetype = "NvimTree",
      text = "Explore",
      highlight = "NvimTreeNormal",
      separator = true,
    }
  },

  highlights = {
    fill = {
      background = {
        --bg = "black",
      },
    },
  },
}

require("bufferline").setup({ options = options })
