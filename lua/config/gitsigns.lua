require("gitsigns").setup {
  signs = {
    add          = { text = "┃" },
    change       = { text = "┃" },
    delete       = { text = "_" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
    untracked    = { text = "┆" },
  },
        signcolumn = true,
        numhl      = false,
        linehl     = false,
        word_diff  = false,
        current_line_blame = false,
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local function map(mode, l, r, opts)
          opts = opts or {}
  opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
    end
    -- hunk navigation
    map('n', ']c', gs.next_hunk)
    map('n', '[c', gs.prev_hunk)
    -- stage/reset
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
    -- preview
    map('n', '<leader>hp', gs.preview_hunk)
    -- blame
    map('n', '<leader>hb', function() gs.blame_line({ full = true }) end)
    end
}
