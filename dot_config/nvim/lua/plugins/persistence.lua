return {
	{
		"folke/persistence.nvim",

		-- Only start session saving after an actual file has been opened.
		event = "BufReadPre",

		opts = {
			-- Keep one Neovim session per project instead of one per Git branch.
			branch = false,
		},

		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore session",
			},
			{
				"<leader>qS",
				function()
					require("persistence").select()
				end,
				desc = "Select session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore last session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't save current session",
			},
		},
	},
}
