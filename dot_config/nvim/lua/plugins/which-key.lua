return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",

		opts = {
			preset = "modern",
			delay = 250,

			spec = {
				{ "<leader>h", group = "Git Hunk" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>x", group = "Diagnostics" },
				{ "<leader>f", group = "Find" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>g", group = "Git" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>t", group = "Terminal" },
				{ "<leader>u", group = "UI" },
				{ "<leader>m", group = "Markdown / Media" },
			},
		},

		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
		},
	},
}
