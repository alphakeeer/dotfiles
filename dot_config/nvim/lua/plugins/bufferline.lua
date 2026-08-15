return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			options = {
				-- Keep the tabline out of the way until there is something to compare.
				always_show_bufferline = false,

				diagnostics = "nvim_lsp",

				separator_style = "slope",

				-- Snacks Explorer exposes its full-height sidebar as a layout box.
				-- Leave that area clear instead of drawing buffer tabs across it.
				offsets = {
					{
						filetype = "snacks_layout_box",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
						separator = true,
					},
				},

				close_command = function(bufnr)
					Snacks.bufdelete(bufnr)
				end,

				right_mouse_command = function(bufnr)
					Snacks.bufdelete(bufnr)
				end,
			},
		},
	},
}
