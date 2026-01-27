-- lua/plugins/barbar.lua

require('barbar').setup({
  -- Hide tabline when there's only 1 buffer
  auto_hide = 1,

  -- Sidebar integration
  sidebar_filetypes = {
    ["neo-tree"] = { event = "BufWipeout" },
  },

  icons = {
    buffer_index = false,
    buffer_number = false,
    button = "",
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = false },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },
    filetype = { enabled = true },
    separator = { left = "▎", right = "" },
    separator_at_end = true,
    modified = { button = "●" },
    pinned = { button = "車" },
    inactive = { separator = { left = "▎", right = "" } },
  },

  -- Maximum buffer name length
  maximum_length = 30,
})
