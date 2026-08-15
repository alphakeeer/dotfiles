-- Autocommands will be added here as needed.

-- ============================================================
-- Config diagnostics
-- ============================================================

vim.api.nvim_create_user_command("ConfigInfo", function()
	local platform = require("config.platform")

	local tools = {
		"git",
		"rg",
		"fd",
		"lazygit",
		"tree-sitter",
		"node",
		"npm",
		"magick",
		"gs",
		"tectonic",
		"mmdc",
	}

	local lines = {
		"Neovim Configuration",
		"====================",
		"",
		"OS:        " .. platform.os,
		"SSH:       " .. tostring(platform.is_ssh),
		"Neovim:    " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
		"Config:    " .. vim.fn.stdpath("config"),
		"Data:      " .. vim.fn.stdpath("data"),
		"State:     " .. vim.fn.stdpath("state"),
		"",
		"External tools:",
	}

	for _, tool in ipairs(tools) do
		local found = platform.has(tool)
		table.insert(lines, string.format("  %-14s %s", tool, found and "✓" or "✗"))
	end

	vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
		title = "Config Info",
	})
end, {})
