local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup {
  --------------------------------------------------------------------------------------------------
  -- THEMES:
  {
    "attict/attic.nvim",
    config = function()
      require "config.attic"
    end,
  },

  --------------------------------------------------------------------------------------------------
  -- UI:
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "config.nvim-tree"
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require "config.lualine"
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require "config.bufferline"
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require "config.indent-blankline"
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "config.treesitter"
    end,
  },

  --------------------------------------------------------------------------------------------------
  -- LSP / DAP / Linting:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "config.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "config.mason"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "config.mason-lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = "onsails/lspkind.nvim",
    config = function()
      require "config.nvim-cmp"
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    config = function()
      require "config.luasnip"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "config.gitsigns"
    end,
  },


}
