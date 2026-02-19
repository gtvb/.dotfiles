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
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "ThePrimeagen/harpoon" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")

      lint.linters.clangtidy.args = {
          "--quiet",
          "--",
          "-std=c11",
      }

      lint.linters_by_ft = {
        lua = { "luacheck" },
        c = { "clangtidy" },
        python = { "ruff" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

})
