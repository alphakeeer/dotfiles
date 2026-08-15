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

-- A single j/k moves one display line. Holding either key causes repeated input
-- events; after the first one, accelerate each event to three display lines.
local last_motion_at = { j = 0, k = 0 }
local repeat_threshold_ns = 125 * 1000 * 1000

local function vertical_motion(key)
  if vim.v.count > 0 then
    return vim.v.count .. "g" .. key
  end

  local now = vim.uv.hrtime()
  local is_repeating = now - last_motion_at[key] <= repeat_threshold_ns
  last_motion_at[key] = now

  return (is_repeating and "3" or "") .. "g" .. key
end

map("n", "j", function()
  return vertical_motion("j")
end, { expr = true, silent = true, desc = "Move Down (accelerates when held)" })

map("n", "k", function()
  return vertical_motion("k")
end, { expr = true, silent = true, desc = "Move Up (accelerates when held)" })

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

map("n", "<leader>q", "<cmd>qall<CR>", {
  desc = "Quit Neovim",
})

map("n", "<leader>wc", "<cmd>close<CR>", {
  desc = "Close Window",
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
