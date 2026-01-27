-- Add lazy to runtimepath
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- Load plugins
require("lazy").setup({
  -- plugins go here
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
	bigfile = { enabled = true },
	indent = { enabled = true },
  }
}
})
