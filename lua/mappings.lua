vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { silent = true, noremap = true }

-- General
vim.keymap.set("n", "<C-a>", "<esc>ggVG<CR>", opts)     -- Select All
vim.keymap.set("n", "<C-j>", "<S-Down>", opts)          -- Page Down
vim.keymap.set("n", "<C-k>", "<S-Up>", opts)            -- Page Up
vim.keymap.set("v", "<Tab>", ">gv", opts)               -- Indent
vim.keymap.set("v", "<S-Tab>", "<gv", opts)             -- De-Indent

-- Telescope
vim.keymap.set("n", "<C-f>", ':lua require("telescope")<CR> <cmd>Telescope live_grep<cr>', opts)
vim.keymap.set("n", "<C-p>", ':lua require("telescope")<CR> <cmd>Telescope find_files<cr>', opts)

-- Nvim-Tree
vim.keymap.set("n", "<C-\\>", ":NvimTreeToggle<CR>", opts)

-- LSP-Config
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)

-- BufferLine
--vim.keymap.set("n", "gt", ":bnext<cr>", opts)
--vim.keymap.set("n", "gT", ":bprev<cr>", opts)
--
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
