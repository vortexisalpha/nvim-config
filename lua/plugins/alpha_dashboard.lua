local M = {}

function M.setup()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

  -- Use ascii.nvim for the NeoVim logo
  local ascii_ok, ascii = pcall(require, "ascii")
  if ascii_ok then
    -- Use the neovim logo from ascii.nvim
    dashboard.section.header.val = ascii.art.text.neovim.sharp
  else
    -- Fallback if ascii.nvim isn't loaded yet
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗              ]],
      [[       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║              ]],
      [[       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║              ]],
      [[       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║              ]],
      [[       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║              ]],
      [[       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝              ]],
      [[                                                                       ]],
    }
  end

  -- Welcome message
  local welcome = {
    type = "text",
    val = "Welcome back, Josh",
    opts = {
      position = "center",
      hl = "AlphaWelcome",
    },
  }

  -- Styled buttons with Nerd Font icons (using Unicode escapes)
  local icons = {
    find = "\u{f002}",     -- 
    file = "\u{f15b}",     -- 
    recent = "\u{f017}",   -- 
    word = "\u{f0b0}",     -- 
    bookmark = "\u{f02e}", -- 
    palette = "\u{f1fc}",  -- 
    cog = "\u{f013}",      -- 
    plug = "\u{f1e6}",     -- 
    power = "\u{f011}",    -- 
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", "  " .. icons.find .. "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("r", "  " .. icons.recent .. "  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("g", "  " .. icons.word .. "  Find Word", ":Telescope live_grep<CR>"),
    dashboard.button("b", "  " .. icons.bookmark .. "  Bookmarks", ":Telescope marks<CR>"),
    dashboard.button("t", "  " .. icons.palette .. "  Themes", ":Telescope colorscheme<CR>"),
    dashboard.button("c", "  " .. icons.cog .. "  Config", ":e $MYVIMRC<CR>"),
    dashboard.button("p", "  " .. icons.plug .. "  Sync Plugins", ":PackerSync<CR>"),
    dashboard.button("q", "  " .. icons.power .. "  Quit", ":qa<CR>"),
  }

  -- Style buttons
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
    button.opts.width = 50
    button.opts.cursor = 3
  end

  -- Footer with stats
  dashboard.section.footer.val = function()
    local v = vim.version()
    local datetime = os.date("%A, %B %d")

    -- Count plugins from packer
    local plugins_count = 0
    local status_ok, _ = pcall(require, "packer")
    if status_ok then
      local packer_plugins = _G.packer_plugins
      if packer_plugins then
        for _ in pairs(packer_plugins) do
          plugins_count = plugins_count + 1
        end
      end
    end

    local info = "Neovim v" .. v.major .. "." .. v.minor .. "." .. v.patch
    if plugins_count > 0 then
      info = info .. "  |  " .. plugins_count .. " plugins"
    end
    info = info .. "  |  " .. datetime

    return { "", info }
  end

  -- Tokyo Night themed highlights
  vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7aa2f7", bold = true })
  vim.api.nvim_set_hl(0, "AlphaWelcome", { fg = "#bb9af7", italic = true })
  vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#a9b1d6" })
  vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#bb9af7", bold = true })
  vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#565f89", italic = true })

  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.footer.opts.hl = "AlphaFooter"

  -- Layout matching the clean look
  dashboard.config.layout = {
    { type = "padding", val = 4 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    welcome,
    { type = "padding", val = 3 },
    dashboard.section.buttons,
    { type = "padding", val = 2 },
    dashboard.section.footer,
  }

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.config)

  -- Hide statusline/tabline on dashboard
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
      vim.opt_local.laststatus = 0
      vim.opt_local.showtabline = 0
    end,
  })

  vim.api.nvim_create_autocmd("BufUnload", {
    buffer = 0,
    callback = function()
      vim.opt.laststatus = 3
      vim.opt.showtabline = 2
    end,
  })
end

return M
