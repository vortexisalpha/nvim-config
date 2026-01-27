require("mini.pairs").setup()

require("mini.animate").setup({
  scroll = { enable = true },
  cursor = { enable = false }, -- cursor animation can feel weird; optional
  resize = { enable = true },
  open = { enable = true },
  close = { enable = true },
})
