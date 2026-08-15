local opt = vim.opt

-- ============================================================
-- UI
-- ============================================================

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.background = "dark"

opt.signcolumn = "yes"
opt.cursorline = true

-- Always leave some context around the cursor
opt.scrolloff = 8
opt.sidescrolloff = 8

-- ============================================================
-- Editing
-- ============================================================

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

opt.wrap = false

-- ============================================================
-- Search
-- ============================================================

opt.ignorecase = true
opt.smartcase = true

opt.incsearch = true
opt.hlsearch = true

-- ============================================================
-- Splits
-- ============================================================

opt.splitright = true
opt.splitbelow = true

-- ============================================================
-- Responsiveness
-- ============================================================

opt.updatetime = 250
opt.timeoutlen = 300

-- ============================================================
-- Files
-- ============================================================

opt.swapfile = false

-- Persistent undo history
opt.undofile = true

-- ============================================================
-- Completion UI
-- ============================================================

opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}

-- ============================================================
-- Whitespace / rendering
-- ============================================================

opt.list = true
opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Statusline handles mode display
opt.showmode = false

-- Single global statusline
opt.laststatus = 3
-- ============================================================
-- Clipboard
-- ============================================================

-- Use the system clipboard by default.
-- On SSH + tmux, config.platform redirects this through tmux buffers.
-- On SSH without tmux it is left empty to avoid slow OSC 52 queries;
-- use the terminal's own copy/paste there.
if not vim.g.ssh_without_tmux then
  opt.clipboard = "unnamedplus"
end
