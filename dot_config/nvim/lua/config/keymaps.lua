vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- ============================================================
-- Window navigation
-- ============================================================

map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- ============================================================
-- Better movement
-- ============================================================

map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

-- Keep selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- ============================================================
-- General
-- ============================================================

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  desc = "Clear Search Highlight",
})

map("n", "<leader>w", "<cmd>write<CR>", {
  desc = "Save File",
})

map("n", "<leader>q", "<cmd>quit<CR>", {
  desc = "Quit Window",
})

-- ============================================================
-- Buffers
-- ============================================================

map("n", "]b", "<cmd>bnext<CR>", {
  desc = "Next Buffer",
})

map("n", "[b", "<cmd>bprevious<CR>", {
  desc = "Previous Buffer",
})

map("n", "<leader>bn", "<cmd>bnext<CR>", {
  desc = "Next Buffer",
})

map("n", "<leader>bp", "<cmd>bprevious<CR>", {
  desc = "Previous Buffer",
})

map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, {
  desc = "Delete Buffer",
})

map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, {
  desc = "Delete Other Buffers",
})

-- ============================================================
-- Terminal
-- ============================================================

map({ "n", "t" }, "<leader>tt", function()
  Snacks.terminal.toggle()
end, {
  desc = "Toggle Terminal",
})

map("n", "<leader>tf", function()
  Snacks.terminal.toggle(nil, {
    win = {
      position = "float",
      border = "rounded",
    },
  })
end, {
  desc = "Floating Terminal",
})

-- ============================================================
-- Git
-- ============================================================

map("n", "<leader>gg", function()
  Snacks.lazygit()
end, {
  desc = "LazyGit",
})

map("n", "<leader>gl", function()
  Snacks.lazygit.log()
end, {
  desc = "Git Log",
})

map("n", "<leader>gf", function()
  Snacks.lazygit.log_file()
end, {
  desc = "Current File Git Log",
})
