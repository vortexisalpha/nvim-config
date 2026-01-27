vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Neo-tree" })

vim.keymap.set("n", "gb", "<C-o>",{desc = "Go back"})
vim.keymap.set("n", "gf", "<C-i>",{desc = "Go forward"})


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{desc = "Move selection up"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = "Move selection down"})

vim.keymap.set("n", "Y", "yg$",{desc = "Yank untill end of line"})
vim.keymap.set("n", "J", "mzJ`z",{desc = "J keeps cursor in place"})
vim.keymap.set("n", "<C-u>", "<C-u>zz",{desc = "Go up and center"})
vim.keymap.set("n", "<C-d>", "<C-d>zz",{desc = "Go down and center"})

vim.keymap.set("n", "n", "nzzzv",{desc = "Search center fwd"})
vim.keymap.set("n", "N", "Nzzzv",{desc = "Search center back"})

vim.keymap.set("x", "p", "\"_dP", {desc = "replace doesnt put in buffer"})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- buffer nav:
vim.keymap.set("n", "H", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete buffer" })

local Terminal = require("toggleterm.terminal").Terminal

-- Persistent terminals
local float_term = Terminal:new({ direction = "float", hidden = true })
local right_term = Terminal:new({ direction = "vertical", hidden = true })
local top_term   = Terminal:new({ direction = "horizontal", hidden = true })

vim.keymap.set("n", "<leader>tt", function()
  float_term:toggle()
end, { desc = "Toggle floating terminal" })

vim.keymap.set("n", "<leader>tl", function()
  right_term:toggle()
end, { desc = "Toggle right terminal" })

vim.keymap.set("n", "<leader>tk", function()
  top_term:toggle()
end, { desc = "Toggle top terminal" })


vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
