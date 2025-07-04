local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 1000 }
  end,
})

-- Remove trailing writespace on pre-write
autocmd("BufWritePre", {
  pattern = { "*" },
  --command = [[%s/\s\+$//e]],
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end
})

