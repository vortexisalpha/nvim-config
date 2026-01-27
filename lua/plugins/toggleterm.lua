require("toggleterm").setup({
  -- keep it simple + predictable
  open_mapping = nil,      -- we will define our own mappings
  shade_terminals = true,

  -- float defaults
  direction = "float",
  float_opts = {
    border = "rounded",
  },

  -- split sizing
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return math.floor(vim.o.columns * 0.35)
    end
  end,
})

