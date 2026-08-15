return {
	{
		"mrjones2014/smart-splits.nvim",

		-- tmux integration relies on @pane-is-vim being set immediately.
		lazy = false,

		opts = {
			default_amount = 3,
			disable_multiplexer_nav_when_zoomed = true,
		},

		keys = {
			-- Navigation
			{
				"<C-h>",
				function()
					require("smart-splits").move_cursor_left()
				end,
				desc = "Move left",
			},
			{
				"<C-j>",
				function()
					require("smart-splits").move_cursor_down()
				end,
				desc = "Move down",
			},
			{
				"<C-k>",
				function()
					require("smart-splits").move_cursor_up()
				end,
				desc = "Move up",
			},
			{
				"<C-l>",
				function()
					require("smart-splits").move_cursor_right()
				end,
				desc = "Move right",
			},

			-- Resize
			{
				"<A-h>",
				function()
					require("smart-splits").resize_left()
				end,
				desc = "Resize left",
			},
			{
				"<A-j>",
				function()
					require("smart-splits").resize_down()
				end,
				desc = "Resize down",
			},
			{
				"<A-k>",
				function()
					require("smart-splits").resize_up()
				end,
				desc = "Resize up",
			},
			{
				"<A-l>",
				function()
					require("smart-splits").resize_right()
				end,
				desc = "Resize right",
			},
		},
	},
}
