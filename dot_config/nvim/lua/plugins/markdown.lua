return {
	{
		"MeanderingProgrammer/render-markdown.nvim",

		ft = {
			"markdown",
		},

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {

			link = {
				enabled = true,

				wiki = {
					enabled = true,
					icon = "󱗖 ",
					conceal_destination = true,
				},

				custom = {
					web = {
						pattern = "^http",
						icon = "󰖟 ",
					},

					github = {
						pattern = "github%.com",
						icon = "󰊤 ",
					},
				},
			},

			latex = {
				enabled = false,

				-- Only render in the plugin's normal render modes.
				-- Insert mode therefore returns to source text.
				render_modes = false,

				converter = {
					"utftex",
					"latex2text",
				},

				inline = true,
				block = true,

				position = "center",

				top_pad = 0,
				bottom_pad = 0,

				highlight = "RenderMarkdownMath",
			},

			-- Render in Normal / Command / Terminal mode.
			-- Insert mode falls back to raw Markdown, which makes editing easier.
			render_modes = {
				"n",
				"c",
				"t",
			},

			-- Allow callout / checkbox completion through our existing Blink LSP.
			completions = {
				lsp = {
					enabled = true,
				},
			},

			heading = {
				enabled = true,
				sign = false,
				position = "overlay",
				width = "full",
			},

			code = {
				enabled = true,
				sign = false,
				width = "block",
				right_pad = 1,
			},

			checkbox = {
				enabled = true,
			},

			pipe_table = {
				enabled = true,
				preset = "round",
				cell = "padded",
			},

			-- callout = {
			-- 	note = {
			-- 		raw = "[!NOTE]",
			-- 		rendered = "󰋽 Note",
			-- 		highlight = "RenderMarkdownInfo",
			-- 		category = "github",
			-- 	},
			--
			-- 	tip = {
			-- 		raw = "[!TIP]",
			-- 		rendered = "󰌶 Tip",
			-- 		highlight = "RenderMarkdownSuccess",
			-- 		category = "github",
			-- 	},
			--
			-- 	warning = {
			-- 		raw = "[!WARNING]",
			-- 		rendered = "󰀪 Warning",
			-- 		highlight = "RenderMarkdownWarn",
			-- 		category = "github",
			-- 	},
			--
			-- 	important = {
			-- 		raw = "[!IMPORTANT]",
			-- 		rendered = "󰅾 Important",
			-- 		highlight = "RenderMarkdownHint",
			-- 		category = "github",
			-- 	},
			-- },
		},

		keys = {
			{
				"<leader>mr",
				"<cmd>RenderMarkdown buf_toggle<cr>",
				desc = "Toggle Markdown Render",
			},

			{
				"<leader>mp",
				"<cmd>RenderMarkdown preview<cr>",
				desc = "Markdown Preview",
			},
		},
	},
}
