local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },
  { "tpope/vim-vinegar" },

  { "moll/vim-bbye" },
  { "tjdevries/express_line.nvim" },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "ThePrimeagen/harpoon" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "stevearc/conform.nvim",
    opts = {},
  },
})
