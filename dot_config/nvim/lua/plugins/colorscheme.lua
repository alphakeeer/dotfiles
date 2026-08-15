return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,

		opts = {
			flavour = "mocha",

			-- Ghostty 负责真正的透明 / blur。
			-- Neovim 主编辑区保持透明，让磨砂背景透出来。
			transparent_background = true,

			-- 浮窗作为独立的“玻璃面板”。
			-- 不完全透明，否则代码会从 popup 后面穿出来。
			float = {
				transparent = false,
				solid = false,
			},

			term_colors = true,

			-- 不主动压暗 inactive window。
			-- 多窗口之间主要靠边框和内容层级区分。
			dim_inactive = {
				enabled = false,
			},

			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			lsp_styles = {
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},

				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
					ok = { "undercurl" },
				},

				-- 不给 inlay hints 加一个突兀的色块背景。
				inlay_hints = {
					background = false,
				},
			},

			default_integrations = true,
			auto_integrations = true,

			-- ─────────────────────────────────────────────
			-- Mocha Glass
			-- ─────────────────────────────────────────────
			custom_highlights = function(c)
				return {
					-- ─────────────────────────────
					-- Canvas
					-- 主编辑区域：Ghostty glass
					-- ─────────────────────────────

					Normal = {
						bg = c.none,
					},

					NormalNC = {
						bg = c.none,
					},

					SignColumn = {
						bg = c.none,
					},

					FoldColumn = {
						bg = c.none,
						fg = c.surface1,
					},

					EndOfBuffer = {
						fg = c.surface0,
						bg = c.none,
					},

					NonText = {
						fg = c.surface0,
					},

					Whitespace = {
						fg = c.surface0,
					},

					-- ─────────────────────────────
					-- Current line
					-- 极轻微的 surface，不抢视觉
					-- ─────────────────────────────

					CursorLine = {
						bg = c.mantle,
					},

					CursorLineNr = {
						fg = c.lavender,
						bg = c.none,
						bold = true,
					},

					LineNr = {
						fg = c.surface1,
						bg = c.none,
					},

					-- ─────────────────────────────
					-- Selection
					-- ─────────────────────────────

					Visual = {
						bg = c.surface1,
					},

					VisualNOS = {
						bg = c.surface1,
					},

					-- ─────────────────────────────
					-- Search
					-- ─────────────────────────────

					Search = {
						fg = c.text,
						bg = c.surface1,
						bold = true,
					},

					CurSearch = {
						fg = c.base,
						bg = c.lavender,
						bold = true,
					},

					IncSearch = {
						fg = c.base,
						bg = c.peach,
						bold = true,
					},

					-- ─────────────────────────────
					-- Floating Glass
					--
					-- mantle = panel
					-- surface = border
					-- lavender = active accent
					-- ─────────────────────────────

					NormalFloat = {
						fg = c.text,
						bg = c.mantle,
					},

					FloatBorder = {
						fg = c.surface1,
						bg = c.mantle,
					},

					FloatTitle = {
						fg = c.lavender,
						bg = c.mantle,
						bold = true,
					},

					FloatFooter = {
						fg = c.overlay1,
						bg = c.mantle,
					},

					-- ─────────────────────────────
					-- Popup / completion
					-- ─────────────────────────────

					Pmenu = {
						fg = c.text,
						bg = c.mantle,
					},

					PmenuSel = {
						fg = c.text,
						bg = c.surface0,
						bold = true,
					},

					PmenuSbar = {
						bg = c.surface0,
					},

					PmenuThumb = {
						bg = c.surface2,
					},

					-- ─────────────────────────────
					-- Window separation
					-- 不做明显的“框”
					-- ─────────────────────────────

					WinSeparator = {
						fg = c.surface0,
						bg = c.none,
					},

					VertSplit = {
						fg = c.surface0,
						bg = c.none,
					},

					-- ─────────────────────────────
					-- Matching / references
					-- ─────────────────────────────

					MatchParen = {
						fg = c.lavender,
						bg = c.surface0,
						bold = true,
					},

					-- ─────────────────────────────
					-- Folding
					-- ─────────────────────────────

					Folded = {
						fg = c.overlay1,
						bg = c.mantle,
						italic = true,
					},

					-- ─────────────────────────────
					-- LSP
					-- ─────────────────────────────

					LspInlayHint = {
						fg = c.overlay0,
						bg = c.none,
						italic = true,
					},

					DiagnosticVirtualTextError = {
						fg = c.red,
						bg = c.none,
						italic = true,
					},

					DiagnosticVirtualTextWarn = {
						fg = c.yellow,
						bg = c.none,
						italic = true,
					},

					DiagnosticVirtualTextInfo = {
						fg = c.sapphire,
						bg = c.none,
						italic = true,
					},

					DiagnosticVirtualTextHint = {
						fg = c.teal,
						bg = c.none,
						italic = true,
					},

					DiagnosticUnderlineError = {
						undercurl = true,
						sp = c.red,
					},

					DiagnosticUnderlineWarn = {
						undercurl = true,
						sp = c.yellow,
					},

					DiagnosticUnderlineInfo = {
						undercurl = true,
						sp = c.sapphire,
					},

					DiagnosticUnderlineHint = {
						undercurl = true,
						sp = c.teal,
					},

					-- ─────────────────────────────
					-- Git
					-- ─────────────────────────────

					GitSignsAdd = {
						fg = c.green,
						bg = c.none,
					},

					GitSignsChange = {
						fg = c.blue,
						bg = c.none,
					},

					GitSignsDelete = {
						fg = c.red,
						bg = c.none,
					},

					-- ─────────────────────────────
					-- Misc
					-- ─────────────────────────────

					Directory = {
						fg = c.blue,
						bold = true,
					},

					ColorColumn = {
						bg = c.mantle,
					},

					QuickFixLine = {
						bg = c.surface0,
						bold = true,
					},
				}
			end,
		},

		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
