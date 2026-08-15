return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,

		---@type snacks.Config
		opts = {

			image = {
				enabled = true,

				-- Keep Snacks as a standalone image / PDF viewer,
				-- but do NOT render images, math, or Mermaid inside documents.
				doc = {
					enabled = false,
				},

				math = {
					enabled = false,
				},

				debug = {
					request = false,
					convert = false,
					placement = false,
				},

				convert = {
					notify = false,
				},
			},

			-- Performance
			bigfile = { enabled = true },
			quickfile = { enabled = true },

			-- Start screen
			dashboard = {
				enabled = true,
			},

			-- File navigation
			explorer = {
				enabled = true,
			},

			picker = {
				enabled = true,

				sources = {
					files = {
						hidden = true,
					},

					explorer = {
						hidden = true,
					},
				},
			},

			-- UI
			input = { enabled = true },

			notifier = {
				enabled = true,
				timeout = 3000,
			},

			indent = {
				enabled = true,
			},

			scope = {
				enabled = true,
			},

			statuscolumn = {
				enabled = true,
			},

			-- SSH first: keep motion immediate
			scroll = {
				enabled = false,
			},
		},

		keys = {

			-- ========================================
			-- LSP Navigation
			-- ========================================
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "References",
			},

			{
				"gi",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Implementations",
			},

			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Type Definitions",
			},

			{
				"<leader>ls",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "Document Symbols",
			},

			{
				"<leader>lS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "Workspace Symbols",
			},

			-- ========================================
			-- Files
			-- ========================================

			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},

			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},

			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent Files",
			},

			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},

			-- ========================================
			-- Search
			-- ========================================

			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Find Text",
			},

			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				mode = { "n", "x" },
				desc = "Find Word",
			},

			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},

			-- ========================================
			-- Convenience
			-- ========================================

			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find",
			},

			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},

			{
				"<leader>uh",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},

			{
				"<leader>mi",
				function()
					Snacks.image.hover()
				end,
				desc = "Image Hover",
			},
		},
	},
}
