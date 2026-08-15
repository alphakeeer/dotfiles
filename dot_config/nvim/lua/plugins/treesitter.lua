return {
	{
		"nvim-treesitter/nvim-treesitter",

		-- Current nvim-treesitter main does not support lazy loading.
		lazy = false,

		-- Keep parsers compatible when the plugin is updated.
		build = ":TSUpdate",

		config = function()
			local treesitter = require("nvim-treesitter")

			-- Parsers we want available on every machine.
			local parsers = {
				"bash",
				"c",
				"cpp",

				"html",
				"json",
				"latex",
				"lua",

				"markdown",
				"markdown_inline",

				"python",
				"query",
				"regex",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			}

			-- No-op for parsers that are already installed.
			treesitter.install(parsers)

			-- Tree-sitter features are explicitly enabled in the new API.
			local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

			vim.api.nvim_create_autocmd("FileType", {
				group = group,

				pattern = {
					"bash",
					"c",
					"cpp",
					"json",
					"lua",
					"markdown",
					"python",
					"query",
					"toml",
					"vim",
					"yaml",
					"html",
					"latex",
				},

				callback = function(args)
					-- On the very first startup the parser may still be installing.
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
