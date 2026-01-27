-- lua/config/floatterm.lua
local M = {}

local term_buf ---@type integer|nil
local float_win ---@type integer|nil

local function is_valid_win(win)
  return win and vim.api.nvim_win_is_valid(win)
end

local function is_valid_buf(buf)
  return buf and vim.api.nvim_buf_is_valid(buf)
end

local function ensure_term_buf()
  if is_valid_buf(term_buf) then
    return term_buf
  end

  term_buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch=true
  vim.api.nvim_buf_set_name(term_buf, "FloatTerm")

  -- start terminal job in that buffer
  vim.fn.termopen(vim.o.shell)
  vim.bo[term_buf].bufhidden = "hide"
  vim.bo[term_buf].filetype = "terminal"
  return term_buf
end

local function open_float()
  local buf = ensure_term_buf()

  local width  = math.floor(vim.o.columns * 0.85)
  local height = math.floor(vim.o.lines * 0.75)

  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  float_win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.cmd("startinsert")
end

local function close_float()
  if is_valid_win(float_win) then
    vim.api.nvim_win_close(float_win, true)
  end
  float_win = nil
end

function M.toggle_float()
  if is_valid_win(float_win) then
    close_float()
  else
    open_float()
  end
end

local function dock(cmd)
  local buf = ensure_term_buf()
  close_float()

  vim.cmd(cmd)                 -- create split
  vim.api.nvim_set_current_buf(buf)
  vim.cmd("startinsert")
end

function M.dock_right()
  dock("botright vsplit")
end

function M.dock_top()
  dock("topleft split")
end

return M
