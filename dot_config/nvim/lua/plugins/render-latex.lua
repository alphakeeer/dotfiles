return {
	{
		"techwizrd/render-latex.nvim",

		main = "render_latex",

		ft = "markdown",

		opts = {
			render_modes = {
				"n",
			},

			render = {
				preset = "match_text",

				inline = "highlight",
				inline_symbols = false,

				live_preview = false,
				hide_on_cmdline = true,

				background = "transparent",

				equation_labels = false,
			},

			image = {
				backend = "kitty",
			},

			install = {
				auto = true,
				version = "latest",
			},
		},
	},
}
